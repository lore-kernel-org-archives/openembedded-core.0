Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E5D336AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:50:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jul 2016 11:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,364,1464678000"; d="scan'208";a="734332743"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.47])
	([10.219.5.47])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2016 11:50:00 -0700
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1468514381-6587-1-git-send-email-ross.burton@intel.com>
	<1468514381-6587-2-git-send-email-ross.burton@intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <12a9fa85-952e-eeed-81ee-3bda503225ce@linux.intel.com>
Date: Thu, 14 Jul 2016 13:52:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1468514381-6587-2-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 2/2] build: don't use $B as the default cwd for functions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2016 18:50:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

this is a bitbake change so it was sent to the wrong list.

On 07/14/2016 11:39 AM, Ross Burton wrote:
> When bitbake executes a shell or Python function it can cd/chdir() into a
> directory before executing the task. If no directory is specified then the
> default of $B is used.  However $B is an OpenEmbedded variable and BitBake
> shouldn't be aware of it.
>
> To solve this change the semantics slightly so that if no directory is
> specified, the current working directory isn't changed.  There's also a sanity
> check that emits a warning if a Python task does os.chdir() without restoring
> the old path, and the previous working directory is restored.
>
> This does change semantics: whereas before a function in OE would have $B as the
> working directory unless specified, now the working directory is the top of the
> build tree.  Any breakage this causes can be solved by either adding
> do_some_task[dirs] = "${B}" or by using absolute paths in the task.
>
> [ YOCTO #4634 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   bitbake/lib/bb/build.py | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/bitbake/lib/bb/build.py b/bitbake/lib/bb/build.py
> index 4fb2a77..4f01d66 100644
> --- a/bitbake/lib/bb/build.py
> +++ b/bitbake/lib/bb/build.py
> @@ -188,6 +188,11 @@ class LogTee(object):
>   def exec_func(func, d, dirs = None, pythonexception=False):
>       """Execute a BB 'function'"""
>   
> +    try:
> +        oldcwd = os.getcwd()
> +    except:
> +        oldcwd = None
> +
>       body = d.getVar(func, False)
>       if not body:
>           if body is None:
> @@ -211,9 +216,7 @@ def exec_func(func, d, dirs = None, pythonexception=False):
>               bb.utils.mkdirhier(adir)
>           adir = dirs[-1]
>       else:
> -        adir = d.getVar('B', True)
> -        bb.utils.mkdirhier(adir)
> -
> +        adir = None
>       ispython = flags.get('python')
>   
>       lockflag = flags.get('lockfiles')
> @@ -257,6 +260,13 @@ def exec_func(func, d, dirs = None, pythonexception=False):
>           else:
>               exec_func_shell(func, d, runfile, cwd=adir)
>   
> +    if oldcwd and os.getcwd() != oldcwd:
> +        try:
> +            bb.warn("Task %s changed cwd to %s" % (func, os.getcwd()))
> +            os.chdir(oldcwd)
> +        except:
> +            pass
> +
>   _functionfmt = """
>   {function}(d)
>   """
> @@ -272,7 +282,8 @@ def exec_func_python(func, d, runfile, cwd=None, pythonexception=False):
>       if cwd:
>           try:
>               olddir = os.getcwd()
> -        except OSError:
> +        except OSError as e:
> +            bb.warn("%s: Cannot get cwd: %s" % (func, e))
>               olddir = None
>           os.chdir(cwd)
>   
> @@ -298,8 +309,8 @@ def exec_func_python(func, d, runfile, cwd=None, pythonexception=False):
>           if cwd and olddir:
>               try:
>                   os.chdir(olddir)
> -            except OSError:
> -                pass
> +            except OSError as e:
> +                bb.warn("%s: Cannot restore cwd %s: %s" % (func, olddir, e))
>   
>   def shell_trap_code():
>       return '''#!/bin/sh\n



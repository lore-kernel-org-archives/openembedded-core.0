Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 2C28A72A2D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Apr 2015 19:16:09 +0000 (UTC)
Received: (qmail 27236 invoked by uid 1003); 5 Apr 2015 19:16:10 -0000
Received: from unknown (HELO ?192.168.11.132?)
	(philip@opensdr.com@108.44.116.31)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	5 Apr 2015 19:16:10 -0000
Message-ID: <552189F9.6040405@balister.org>
Date: Sun, 05 Apr 2015 12:16:09 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
In-Reply-To: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: Re: [wic][PATCH] wic: extended list of paths in find_binary_path
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
X-List-Received-Date: Sun, 05 Apr 2015 19:16:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 04/04/2015 10:20 AM, Ed Bartosh wrote:
> wic requires tools that are not always possible to find in $PATH.
> This causes wic to fail with confusing errors like this:
>  External command 'parted' not found, exiting.
>    (Please install 'parted' on your host system)
> 
> Adding ~/bin/, /usr/local/sbin, /usr/local/bin, /usr/sbin, /usr/bin,
> /sbin and /bin to the list of paths makes find_binary_path to
> produce more reliable results.

I'm with Otavio. Given wic is intimately dependent on internal build
artifacts, it should use utilities from the sysroot and not depend on
tools from the path. Let's make wic 100% before creating a tool to build
images from packages.

Philip

> 
> [YOCTO #7122]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/utils/fs_related.py | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
> index ea9f85c..832a44a 100644
> --- a/scripts/lib/wic/utils/fs_related.py
> +++ b/scripts/lib/wic/utils/fs_related.py
> @@ -32,13 +32,16 @@ from wic.utils.errors import *
>  from wic.utils.oe.misc import *
>  
>  def find_binary_path(binary):
> +    paths = []
>      if os.environ.has_key("PATH"):
>          paths = os.environ["PATH"].split(":")
> -    else:
> -        paths = []
> -        if os.environ.has_key("HOME"):
> -            paths += [os.environ["HOME"] + "/bin"]
> -        paths += ["/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"]
> +    if os.environ.has_key("HOME"):
> +        path = os.path.join(os.environ["HOME"], "bin")
> +        if path not in paths:
> +            paths.append(path)
> +    for path in ["/usr/local/sbin", "/usr/local/bin", "/usr/sbin", "/usr/bin", "/sbin", "/bin"]:
> +        if path not in paths:
> +            paths.append(path)
>  
>      for path in paths:
>          bin_path = "%s/%s" % (path, binary)
> 


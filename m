Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2EC76C66B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 01:51:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAQ1pA7k016145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Nov 2018 17:51:10 -0800 (PST)
Received: from [128.224.163.169] (128.224.163.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 25 Nov 2018 17:51:09 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	<openembedded-core@lists.openembedded.org>
References: <20181125011155.16251-1-pkj@axis.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <3286498f-25bf-27ab-78fb-1a99d93a2b6e@windriver.com>
Date: Mon, 26 Nov 2018 09:51:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181125011155.16251-1-pkj@axis.com>
Subject: Re: [PATCH] Revert "terminal.bbclass: use var-SHELL as the shebang of wrapper script"
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
X-List-Received-Date: Mon, 26 Nov 2018 01:51:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/11/25 上午9:11, Peter Kjellerstedt wrote:
> The $SHELL environment variable is used for the user's preferred
> interactive shell. This shall not be used when executing shell scripts
> that expect POSIX shell syntax as there is no guarantee that it is a
> POSIX compatible shell.

There is a sanity check to `/bin/sh' to dash or bash

`eaa0dc2 sanity.bbclass: Only verify /bin/sh link if it's a link'

`ecdfdd7 sanity.bbclass: check /bin/sh is dash or bash'


> This reverts commit 27e2ede65f1193e49f9483b08a55495d88740a65.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> In my case, $SHELL is set to /bin/zsh, with the result that devshell
> fails to start. If there is some problem with devshell related to
> /bin/sh being linked to dash rather than bash (which the original
> commit indicates), then that should be adressed instead.
>
> Hongxu: Do you have any additional information related to why you made
> the change in the first place?

If revert this patch, we will have the issue which this patch have fixed.

There is another patch in mailing list that fix the issue you report

[OE-core] [PATCH] devshell.bbclass/terminal.bbclass: add a shell check 
at devshell

While var-SHELL is neither `bash' or `dash', such as
`csh', loading the wrapper script will fail at devshell,
because csh does not support syntax `export'.

Add a shell check at devshell, and use `/bin/sh' to replace
if shell is neither `bash' or `dash'. `/bin/sh' is safe to
use since `ecdfdd7 sanity.bbclass: check /bin/sh is dash
or bash'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
  meta/classes/devshell.bbclass | 4 ++++
  meta/classes/terminal.bbclass | 4 +++-
  2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index fdf7dc1..c4765db 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -3,6 +3,10 @@ inherit terminal
  DEVSHELL = "${SHELL}"

  python do_devshell () {
+    devshell = d.getVar('DEVSHELL')
+    devshell = devshell if devshell.endswith("bash") or 
devshell.endswith("dash") else '/bin/sh'
+    d.setVar('DEVSHELL', devshell)
+
      if d.getVarFlag("do_devshell", "manualfakeroot"):
         d.prependVar("DEVSHELL", "pseudo ")
         fakeenv = d.getVar("FAKEROOTENV").split()
diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 73e765d..f427538 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -25,7 +25,9 @@ def emit_terminal_func(command, envdata, d):
      bb.utils.mkdirhier(os.path.dirname(runfile))

      with open(runfile, 'w') as script:
-        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
+        shell = d.getVar('SHELL')
+        shell = shell if shell.endswith("bash") or 
shell.endswith("dash") else '/bin/sh'
+        script.write('#!/usr/bin/env %s\n' % shell)
          script.write('set -e\n')
          bb.data.emit_func(cmd_func, script, envdata)
          script.write(cmd_func)

//Hongxu


>   meta/classes/terminal.bbclass | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
> index 73e765d57a..a27e10c6ec 100644
> --- a/meta/classes/terminal.bbclass
> +++ b/meta/classes/terminal.bbclass
> @@ -25,8 +25,7 @@ def emit_terminal_func(command, envdata, d):
>       bb.utils.mkdirhier(os.path.dirname(runfile))
>   
>       with open(runfile, 'w') as script:
> -        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
> -        script.write('set -e\n')
> +        script.write('#!/bin/sh -e\n')
>           bb.data.emit_func(cmd_func, script, envdata)
>           script.write(cmd_func)
>           script.write("\n")




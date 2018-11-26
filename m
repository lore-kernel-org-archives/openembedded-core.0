Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 158E06C646
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 01:57:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAQ1v2aQ001939
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Nov 2018 17:57:02 -0800 (PST)
Received: from [128.224.163.169] (128.224.163.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 25 Nov 2018 17:57:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1535958596-11573-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <3c29358c-8127-fdda-c6ad-26adcc8b1193@windriver.com>
Date: Mon, 26 Nov 2018 09:57:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1535958596-11573-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH] devshell.bbclass/terminal.bbclass: add a shell check at devshell
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
X-List-Received-Date: Mon, 26 Nov 2018 01:57:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping, any comments?

//Hongxu

On 2018/9/3 下午3:09, Hongxu Jia wrote:
> While var-SHELL is neither `bash' or `dash', such as
> `csh', loading the wrapper script will fail at devshell,
> because csh does not support syntax `export'.
>
> Add a shell check at devshell, and use `/bin/sh' to replace
> if shell is neither `bash' or `dash'. `/bin/sh' is safe to
> use since `ecdfdd7 sanity.bbclass: check /bin/sh is dash
> or bash'
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/classes/devshell.bbclass | 4 ++++
>   meta/classes/terminal.bbclass | 4 +++-
>   2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index fdf7dc1..c4765db 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -3,6 +3,10 @@ inherit terminal
>   DEVSHELL = "${SHELL}"
>   
>   python do_devshell () {
> +    devshell = d.getVar('DEVSHELL')
> +    devshell = devshell if devshell.endswith("bash") or devshell.endswith("dash") else '/bin/sh'
> +    d.setVar('DEVSHELL', devshell)
> +
>       if d.getVarFlag("do_devshell", "manualfakeroot"):
>          d.prependVar("DEVSHELL", "pseudo ")
>          fakeenv = d.getVar("FAKEROOTENV").split()
> diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
> index 73e765d..f427538 100644
> --- a/meta/classes/terminal.bbclass
> +++ b/meta/classes/terminal.bbclass
> @@ -25,7 +25,9 @@ def emit_terminal_func(command, envdata, d):
>       bb.utils.mkdirhier(os.path.dirname(runfile))
>   
>       with open(runfile, 'w') as script:
> -        script.write('#!/usr/bin/env %s\n' % d.getVar('SHELL'))
> +        shell = d.getVar('SHELL')
> +        shell = shell if shell.endswith("bash") or shell.endswith("dash") else '/bin/sh'
> +        script.write('#!/usr/bin/env %s\n' % shell)
>           script.write('set -e\n')
>           bb.data.emit_func(cmd_func, script, envdata)
>           script.write(cmd_func)




Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id ECFE460167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 17:07:01 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 131so13681028ykp.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 09:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Tmf416RwDybcv6YXUFtazpp+HGJGalfmV7ydfMNH42k=;
	b=tEigEuVHSCzFJy3I30DQW+Z40BWSfODfq+QMjZWQSnGcqVgvc+nni/4wZwMubKG3CH
	xCvGX3L+bDU4ZCGQpKe3q3/KO4MHoGKkIh7xTCyuE8K8WhBPFeLq0rvQmXv4vJQXKHYD
	kETG460D6dgybOrrAs3mthA+brXjdi0KIqvuoGM8VNzWT7NaILEIT45YK8UX/0GQg+Za
	w8gBK8YUupj3rxqrSg29IdmFVVAI+IotyFm40RwFjfuTQpoVamEke8/uELx7mD9X1OrL
	EAOPGnz0/1EcI+tlaXizWFvB8qcLvnPHVa/fHdBuJ2XGwotxOjcBUsR3fFmefiPT6xJF
	707A==
MIME-Version: 1.0
X-Received: by 10.170.162.135 with SMTP id e129mr1138520ykd.110.1424106422207; 
	Mon, 16 Feb 2015 09:07:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 16 Feb 2015 09:07:02 -0800 (PST)
In-Reply-To: <1424103869.25541.1.camel@linuxfoundation.org>
References: <1424103869.25541.1.camel@linuxfoundation.org>
Date: Mon, 16 Feb 2015 15:07:02 -0200
X-Google-Sender-Auth: vbzzRe8XACZw1cJI26yXk9XOmdA
Message-ID: <CAP9ODKovgahoQk58sMo_hXMkzQFU0qjP1JrazqKo_A7=2UfviQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk: Handle OLDEST_KERNEL
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
X-List-Received-Date: Mon, 16 Feb 2015 17:07:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 16, 2015 at 2:24 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Add a check to the SDK so that it only runs on systems with kernel versions
> it supports.
>
> [YOCTO #6856]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 8b7e9ea..e3adacb 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -126,6 +126,7 @@ EOF
>         # substitute variables
>         sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
>                 -e 's#@SDKPATH@#${SDKPATH}#g' \
> +               -e 's#@OLDEST_KERNEL@#${OLDEST_KERNEL}#g' \
>                 -e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
>                 -e '/@SDK_POST_INSTALL_COMMAND@/d' \
>                 ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
> diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
> index 4a7fbd5..64e87a2 100644
> --- a/meta/files/toolchain-shar-template.sh
> +++ b/meta/files/toolchain-shar-template.sh
> @@ -3,6 +3,24 @@
>  INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>  SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
>
> +verlte () {
> +       [  "$1" = "`printf "$1\n$2" | sort -V | head -n1`" ]
> +}
> +
> +verlt() {
> +       [ "$1" = "$2" ] && return 1 || verlte $1 $2
> +}
> +
> +verlt `uname -r` @OLDEST_KERNEL@
> +if [ $? = 0 ]; then
> +       echo "Error: The SDK needs a kernel > @OLDEST_KERNEL@"
> +       exit 1
> +fi
> +
> +
> +verlte `uname -r` 3.18.0 && echo "yes" || echo "no"
> +verlte 4.16 3.18.0 && echo "yes" || echo "no"

Is this a development code forgotten? :)

>  if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
>         # Allow for installation of ix86 SDK on x86_64 host
>         if [ "$INST_ARCH" != x86_64 -o "$SDK_ARCH" != ix86 ]; then
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


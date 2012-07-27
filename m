Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Suu4T-0001ZU-BH
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 01:35:49 +0200
Received: by lags15 with SMTP id s15so2161814lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 16:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=hIB6bmMoLdCpqBebiIkFjW8675d8cNVACtIVWy7qKQk=;
	b=KsGkzCWZ3yjXmzjVNeT0s2+Psk1ufHNscFSpDMEu6tTLl26ZZEajL2HcZtAHiezHCy
	EJuOjLXN6Ui1YL7tgjNIzKhX29HWiTgXeBO+DHYS/xZJtsUvxcX88pmkrXI1UPjm7DFQ
	Y/Fn9gdUKOcQUTNsVuKV7SeMhZD0pNRo923l4Gy0t685cPQSygrN/KPQNt5D5tBlLC+r
	1maMZxfDzbypTlcSzop6AcQjtkhcRWLGNqgv38Mzz/+vEVXmYAYumJouz3r8cccrnSd3
	S7sB5CHsc5u4m24zCESqALQVI9fo34W5sGx6efjspVCy9gScTNEykh6iFfq7Y3tUkvot
	xWXg==
Received: by 10.152.148.1 with SMTP id to1mr4139569lab.34.1343431456557; Fri,
	27 Jul 2012 16:24:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Fri, 27 Jul 2012 16:23:56 -0700 (PDT)
In-Reply-To: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
References: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 27 Jul 2012 16:23:56 -0700
X-Google-Sender-Auth: OfVRzAgphxr6EpEv_HBIr4eZFQQ
Message-ID: <CABcZAN=5+3sCySjmpRcK_MYDCAF2BsuWcVWJu5u1PitdQZBn0A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH V2 1/2] kernel.bbclass: fix external module building
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2012 23:35:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 20, 2012 at 4:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> From: Denis Carikli <GNUtoo@no-log.org>
>
> Without that fix we have the following while compiling compat-wireless.
>   include/linux/mmzone.h:18:30: fatal error: generated/bounds.h: No such file or directory
>
> Note that the compat-wireless recipe will be added in another commit.
>
> make -C $kerneldir _mrproper_scripts deleted this file along with
> other things so we resurrect it with this patch.
>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/kernel.bbclass |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 08b5e61..ce4d7de 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -187,6 +187,9 @@ kernel_do_install() {
>                 cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
>         fi
>
> +       # Necessary for building modules like compat-wireless.
> +       cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
> +
>         # Remove the following binaries which cause strip or arch QA errors
>         # during do_package for cross-compiled platforms
>         bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
> --
> 1.7.9.5

As an fyi, this seems to have broken compatibility with 2.6 kernel
recipes, as bounds.h doesn't live in generated/ there.
-- 
Christopher Larson



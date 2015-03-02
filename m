Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id BCB7B72D75
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 16:11:14 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id j5so4420325qga.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 08:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dCUXPtOvg1+7Z2QSXgc2zezwGokUTQnx0HVsQpjRuFM=;
	b=Y/ww0lJpTT4vYiGOkV9fYyn9WIVk4CRyT+YqyCRg5U1qWHRc//o/ox8/vKDyuniyqp
	GV3cOON6JJbuwS5lectkygPpFChaNOGln1jWDORdY7IxyPWooQGY77yelbtk/PWwWe+h
	8O5Z8G5S6XPg6xIJ+8EmDvx2xfbuKQFI2+Yw2IplndxQ/X8A4d0X3I3xGS5orY4rmEaO
	Wg3r/bJnTo4nRGFfApmMNyCDbxQTSHC+eYSpvkDrT4/WNDljL3GO44SY1udk8dVrFNnA
	BBiYCSY4KlBl9c8m4s5D1y/FOMMVpoFq0lhxJPgOOMe/L2bkJlSewrLZB30JEvcJEXaR
	b+wg==
MIME-Version: 1.0
X-Received: by 10.140.20.226 with SMTP id 89mr50096777qgj.16.1425312675511;
	Mon, 02 Mar 2015 08:11:15 -0800 (PST)
Received: by 10.96.118.39 with HTTP; Mon, 2 Mar 2015 08:11:15 -0800 (PST)
In-Reply-To: <c8596d4e77f4604c819df7adc5851592f90bb5e9.1425281547.git.Qi.Chen@windriver.com>
References: <cover.1425281547.git.Qi.Chen@windriver.com>
	<c8596d4e77f4604c819df7adc5851592f90bb5e9.1425281547.git.Qi.Chen@windriver.com>
Date: Mon, 2 Mar 2015 10:11:15 -0600
Message-ID: <CACS+7ZQEjcti2YCOVn==BFL2cs0C9tazV2J1OJEErhbxSSyPLw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: avoid parsing error when 'networkd' is enabled in PACKAGECONFIG
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
X-List-Received-Date: Mon, 02 Mar 2015 16:11:16 -0000
Content-Type: text/plain; charset=UTF-8

On 2 March 2015 at 01:37, Chen Qi <Qi.Chen@windriver.com> wrote:
> If 'networkd' is enabled in PACKAGECONFIG, the do_install variable cannot
> be correctly expanded. Error message is like below.
>
> Failure expanding variable do_install: ShellSyntaxError: LexToken(Fi,'fi',0,0)
> followed by:
>   LexToken(NEWLINE,'\n',0,0)
>
> This patch fixes the above problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_219.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index f245239..d785255 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -169,7 +169,7 @@ do_install() {
>         # this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
>         # for existence else it fails
>         if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
> -               ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
> +               ${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}

I did exactly this locally. Works fine.

>         fi
>  }
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


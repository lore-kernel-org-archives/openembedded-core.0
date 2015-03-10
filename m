Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 41E4773A5F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 18:57:34 +0000 (UTC)
Received: by obcva8 with SMTP id va8so3860309obc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 11:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fkkWL51VnaEC1jzcI4iDqk9dnuiYB3alBipksyM2lUU=;
	b=ywe8LjOxHSVsT90CSQ6D9CnJNk7zQwKglhHCV15v6glSpfTiL1n5Dyq3gIlS0FtkoL
	c8U/WKkqh+Y2fn6nng0dsEVLZ8k6UErzZVoY8OCu9dy4gSTvNKsMNKtXYHPjLxIgsc9d
	gKMw4hl1W3AmDUoAIy+cvkpXMFTewsjHZB33hFhqJ/EYf0pwWTgx7ucUqAZebBUzIg4e
	VE7Jz6UgSFs4Ex+W0mnmqb1AwoNc0CgrL8AxT+tNUHN8T/fBcfYx/5gkYyp6chgF0ezt
	VsOHVszwtxAVgad/7fXyBudxcGqWYLL4c50auUkj0BggkaHBlf83X9t0t+8ikH4qT7OF
	iskg==
MIME-Version: 1.0
X-Received: by 10.182.68.104 with SMTP id v8mr27589424obt.64.1426013855727;
	Tue, 10 Mar 2015 11:57:35 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Tue, 10 Mar 2015 11:57:35 -0700 (PDT)
In-Reply-To: <1426009857-1224-1-git-send-email-ross.burton@intel.com>
References: <1426009857-1224-1-git-send-email-ross.burton@intel.com>
Date: Tue, 10 Mar 2015 11:57:35 -0700
Message-ID: <CAJ86T=WcRjnrPt89mRyK_O80r5MyyjA6ifwJ+pGSDewxP+JsgQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devshell: start in ${B} not ${S}
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
X-List-Received-Date: Tue, 10 Mar 2015 18:57:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 10:50 AM, Ross Burton <ross.burton@intel.com> wrote:
> When S=B this is a no-op, but when B!=S this means you can run make and so on
> without having to change directory first.

Just my opinion, but I'd vote against this change. Running
"../temp/run.do_compile" works from either directory but editing
sources and running "quilt refresh" etc only works from ${S}.

>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/devshell.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index 41164a3..051ab72 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -17,7 +17,7 @@ python do_devshell () {
>
>  addtask devshell after do_patch
>
> -do_devshell[dirs] = "${S}"
> +do_devshell[dirs] = "${B}"
>  do_devshell[nostamp] = "1"
>
>  # devshell and fakeroot/pseudo need careful handling since only the final
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


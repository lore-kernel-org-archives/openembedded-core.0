Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 90AB46AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 21:17:48 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id m184so66572811iof.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YdPDViDA6fQf/Ye8Kh6Onl2Txk5dtDe3vO1no/DwrKI=;
	b=vr+MO8Hb9DH0YdLUrA5ldQS6vDnsrfLwV12jJhq2gXGZEylofQafe+20IgEdulY/7c
	1vwnoPWWF2O+VpvhpnsxI1qMPIRzRA+iN539DruGx+gy0abPsSmhutkZcqFim3hyhpt1
	HkLVDZTPXFLkpE1dLSrZGvTeRlSPCmwRHRSwkyuLmN315eocyxPAXVQ2f3109yk0RCYN
	KIBNqacoqC8oY/t1GpfT9C3TZWcmPySqlISHHMMlXp4eMLVITyKoQtClWot+Jn2T/I5b
	fiQFC4Ft39PV6eA8fQExJyFRutaE4lAa/pzwT2uYvC/NkVMB20detd1sGsrJOsk+QWv7
	Lz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YdPDViDA6fQf/Ye8Kh6Onl2Txk5dtDe3vO1no/DwrKI=;
	b=QjvJyFNZaX3gQBwjbZoDXbwWz/D73Ar/bLLCqhGzy7ObcdStdIlnX4qWreHGy4e8Ni
	n/l+lI0ucZGJejwq+Xj4dr6CBXff6pRt+aZpRU5v8XMOFUh+/niNy2MEfdn2D06XU+X1
	Lqz7GqFgNo+13UlzGAw29QywY5N226Y+yHCci5G3nqlDjJz8ukWMtl1FR5RLE/UiZhFg
	2rMcsFrg8lRLXWtt9YXCesknEYPK5hC/au/Dk0Ec8QqlAbdvILxaQTDWv2Xujmw5THjd
	eMCTQBYI4o7RCezXh8ebutfzPS0rCRT+czpafKDfT51tfasFYR37ax7XiSoU8ic9n3yX
	2Jlg==
X-Gm-Message-State: AD7BkJLCcPA3qOuMcAtF77+OMy8yikuVJXUSVxKEaGcae98b5ePgbt3ZOtJx88IaSneqZxflk2Xn255hT7gx2o6u
X-Received: by 10.107.6.32 with SMTP id 32mr5375673iog.99.1458767869151; Wed,
	23 Mar 2016 14:17:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Mar 2016 14:17:29 -0700 (PDT)
In-Reply-To: <1458756234.3476.189.camel@pbcl.net>
References: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
	<1458755798.3476.186.camel@pbcl.net>
	<CAJTo0LbicCM6LJbxEK8m-QES49-WjPJsDUgduV0-dOg1FSEdZw@mail.gmail.com>
	<1458756234.3476.189.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Mar 2016 21:17:29 +0000
Message-ID: <CAJTo0LZL6WKPv+UFNRP9hMO8Ui0F6mLvkKrcM0eBdFJ5bF-pSQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: tighten lib_re and exec_re patterns to avoid false positive
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
X-List-Received-Date: Wed, 23 Mar 2016 21:17:51 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5ca6c253052ebddce6

--001a113fbf5ca6c253052ebddce6
Content-Type: text/plain; charset=UTF-8

On 23 March 2016 at 18:03, Phil Blundell <pb@pbcl.net> wrote:

> Or alternatively, add an extra check so that when it thinks it's found a
> misplaced library, it checks the ELF header to make sure that it really is
> one and suppresses the diagnostic if not.  If you only do this in cases
> where it was about to print a warning anyway then the impact on performance
> shouldn't be too bad.
>

Yeah, best of both worlds.  A flexible regex to catch potential offenders,
and then use oe.qa.ELFFile to verify it's actually a library.  Can you
update the patch Bill?

Ross

--001a113fbf5ca6c253052ebddce6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2016 at 18:03, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div>Or alternatively, add an extra check so =
that when it thinks it&#39;s found a misplaced library, it checks the ELF h=
eader to make sure that it really is one and suppresses the diagnostic if n=
ot.=C2=A0 If you only do this in cases where it was about to print a warnin=
g anyway then the impact on performance shouldn&#39;t be too bad.</div></bl=
ockquote><div><br></div><div>Yeah, best of both worlds.=C2=A0 A flexible re=
gex to catch potential offenders, and then use oe.qa.ELFFile to verify it&#=
39;s actually a library.=C2=A0 Can you update the patch Bill?</div><div><br=
></div><div>Ross=C2=A0</div></div><br></div></div>

--001a113fbf5ca6c253052ebddce6--

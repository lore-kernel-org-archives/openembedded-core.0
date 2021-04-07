Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.6696.1617800388290853475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 05:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=T54TMfzN;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1045)
	id B1D0120B5680; Wed,  7 Apr 2021 05:59:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B1D0120B5680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1617800387;
	bh=SjnjyJ6aHiwPQYJoXBdLZiERxhDcTJBIFXkMePvX3gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T54TMfzNZNfT9TFMdOS/+YanFhKvj7RiU65LO3Jo10zWIX6CVmDdkclsWPe7ZAlez
	 LcIhGRAgbbeNPoAq8KGIQCRDCHOKOoez/1j+4bgxD+LCOKg7zjqsSuW32KAwBD2S0p
	 HKEZw1ftwFpB8ZjQc2v727nZdsY2IDJHBwn7utQE=
Date: Wed, 7 Apr 2021 05:59:47 -0700
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	peter.morrow@microsoft.com
Subject: Re: [meta-mingw][PATCH] go: add environment setup batch file for go
Message-ID: <20210407125947.GA29156@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1617791467-4066-1-git-send-email-pemorrow@linux.microsoft.com>
 <CAJdd5GZZkiq=r5yR2oSLNheVhoqLTDVUCDau1iGKexr=i3Mteg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5GZZkiq=r5yR2oSLNheVhoqLTDVUCDau1iGKexr=i3Mteg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 07, 2021 at 07:56:01AM -0500, Joshua Watt wrote:
> On Wed, Apr 7, 2021 at 5:31 AM Peter Morrow
> <pemorrow@linux.microsoft.com> wrote:
> >
> > When building the nativesdk for mingw we need to set GOROOT in order to build
> > anything out of the box.
> >
> > Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> > ---
> >  recipes-devtools/go/go_%.bbappend | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >  create mode 100644 recipes-devtools/go/go_%.bbappend
> >
> > diff --git a/recipes-devtools/go/go_%.bbappend b/recipes-devtools/go/go_%.bbappend
> > new file mode 100644
> > index 0000000..9933108
> > --- /dev/null
> > +++ b/recipes-devtools/go/go_%.bbappend
> > @@ -0,0 +1,9 @@
> > +do_install_append_class-nativesdk_mingw32() {
> > +    install -d ${D}${SDKPATHNATIVE}/environment-setup.d
> > +
> > +    cat <<EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/go.bat
> > +set GOROOT=%OECORE_NATIVE_SYSROOT%\\usr\\lib\\${BPN}
> > +EOF
> > +}
> > +
> > +FILES_${PN}_append_class-nativesdk_mingw32 = " ${SDKPATHNATIVE}/environment-setup.d"
> > --
> > 1.8.3.1
> >
> 
> I've put this patch in master-next oe meta-mingw. This is the wrong
> mailing list for these patches, please use
> yocto@lists.yoctoproject.org time.

Thanks, noted.

Peter.

Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id B977A65D54
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 22:14:59 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so95767pab.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 15:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BR+BTqDLPhr0C6sFGZdiS9XPe1M13if0x6YUVJCtnpA=;
	b=ZjffKECdCS06BLUhqgSYzyEpOU58Ou7YsGmMOJO2aenDO9s1IAtG02Cm+3zOv6wSyS
	spMRI00neZpHVq6TFqNN3kQ+e1N3m952GZxJus77JdQhe0xmtHTQ1EUBe1kQS89V4DN0
	I/zbrKGVy371KIxC7Odm+WoeOjVdjv0ApD5ZDkPEyc/29O/Lsnypdt/NdsnkfnervF3c
	iqQhLnCOLxlMVCo0MzvUpBmPBd5PuBvdvkRasMslMf1UB1Suvp/ZqngNZgGuxXdnyxpM
	4UAAApiP1CTXA3rRNXYOF1MWGe0s4alWW6cCsBd+PfuH8L8IloY9dLu3+j67vh71jIFs
	ie/g==
X-Received: by 10.68.68.131 with SMTP id w3mr11131206pbt.90.1407190501197;
	Mon, 04 Aug 2014 15:15:01 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	ec10sm67311243pad.33.2014.08.04.15.14.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 15:15:00 -0700 (PDT)
Date: Mon, 4 Aug 2014 15:18:18 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140804221818.GB11951@haswell>
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
	<1418636.H30RBdXEMU@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1418636.H30RBdXEMU@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 22:15:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-04 15:18:05, Paul Eggleton wrote:
> Hi Sujith,
> 
> On Monday 04 August 2014 19:27:08 Sujith H wrote:
> > From: Sujith H <Sujith_Haridasan@mentor.com>
> > 
> > If hostname is not added to /etc/hosts file then rpcinfo
> > command fails when hostname is passed as argument. This was
> > observed when rpcinfo command was tested on freescale target.
> > Below was the output observed without this change.
> > 
> > root@mx6q:~# rpcinfo -s mx6q
> > rpcinfo: can't contact rpcbind: RPC: (unknown error code)
> > 
> > Below is the output after this change:
> > root@mx6q:~# rpcinfo -s mx6q
> >    program version(s) netid(s)                         service     owner
> >     100000  2,3,4     local,udp,tcp,udp6,tcp6          portmapper  superuser
> > root@mx6q:~#
> > 
> > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> > ---
> >  meta/classes/image.bbclass | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 82605f2..7a5a5c1 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {
> >  	fi
> >  }
> > 
> > +ROOTFS_POSTPROCESS_COMMAND += "add_machine_name_loop_back;"
> > +
> > +add_machine_name_loop_back() {
> > +    if [ -n ${MACHINE} ]; then
> > +         echo 127.0.1.1 "       "${MACHINE} >>
> > ${IMAGE_ROOTFS}${sysconfdir}/hosts +    fi
> > +}
> > +
> 
> I think in the earlier discussion the conclusion was that we do not want this 
> enabled by default, which the above will do.
> 
> The question I have is, if this isn't a good idea, is there a better solution?

These things belong to first time install/commissioning of the device
IMO. They are necessary operations but we do not have first time boot
scenario


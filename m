Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.24863.1617036516582681240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 09:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t1b67QmJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12TGmRoW100033;
	Mon, 29 Mar 2021 11:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617036507;
	bh=rLVJB7cpbuV8M3tmq/M7hnqpxpdidcCin/l/a8nHipE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=t1b67QmJip1fJWSbdLEyjYskRI91KC39n+kEVMmzdLuEtm363/n//i50AbuE8Aftp
	 zWaARqb/PzV5z9VDN+ifMLaP9h97X7cYr3kF0ojEP8uq22uHL0QCBCAtChCxOvt86B
	 OUMNGEtlUmcHTLe0YeJnoG3PrXVgTRTWvt0jk4EU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12TGmR5n118720
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Mar 2021 11:48:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 29
 Mar 2021 11:48:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 29 Mar 2021 11:48:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12TGmR8n078643;
	Mon, 29 Mar 2021 11:48:27 -0500
Date: Mon, 29 Mar 2021 11:48:27 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        <praneeth@ti.com>, Denys
 Dmytriyenko <denis@denix.org>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: Provide the correct objcopy to kernel make
Message-ID: <20210329164827.gs2s2e3pcyv6e5f2@winnings>
References: <20210326011304.25640-1-nm@ti.com>
 <CADkTA4M1+oP3nOnibE+AiLNn3gc9T84dgBzGTqjadW3Hd4+tpA@mail.gmail.com>
 <20210329140821.3i7sezuznurbuaqv@smokiness>
 <CADkTA4OH1OtPFCe+fsEe9S=ikSv0Bw-15cMPivGpFBt7zVLxTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OH1OtPFCe+fsEe9S=ikSv0Bw-15cMPivGpFBt7zVLxTA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 11:14-20210329, Bruce Ashfield wrote:
[..]
> > >
> > > So we really have to pass this, when fundamentally it is the same
> > > definition as what the defaults give us.
> > >
> > > What does that resolve to in your builds ? In mine, when I dump the
> > > objcopy value from within the kernel build, I get:
> > >
> > > | /opt/poky/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:443:
> > > *** objcopy: aarch64-poky-linux-objcopy.  Stop.
> > >
> > > Which should be doing the job.
> >
> > x86's objcopy - which is why I was trying to figure out what the heck
> > went on..
> 
> That is indeed strange.
> 
> What does bitbake -e tell you ?
Not sure if it helps.. but..
https://pastebin.ubuntu.com/p/JJHtNkwSwY/

> 
> CROSS_COMPILE should be exported by kernel.bbclass itself,
> it definitely is in my environment dump.
Hmm.. ok - there is something going on.. I see the export in bbclass..

> 
> >
> > >
> > > Are you building arm on arm ? or something else like that ?
> >
> >
> > Nothing fancy.. x86 PC cross compiling for arm. honestly, 5.11 build
> > went fine. What makes me wonder is how does it even build for you? how
> > does OBJCOPY variable even point to aarch64-poky-linux-objcopy
> 
> Indeed. I've done a full set of tests on all the arches for 5.12-rc+ (as
> you can see by the lttng/perf/devsrc patches that I've been sending

Awesome.

> in the past week), so something odd is going on here.

Yes, indeed. I think I will need to look closer at what is going on our
end.. As you pointed out CROSS_COMPILE should really be available in the
environment.. Rest of specific exports tend to  be a never-ending patchup job..

> 
> Are the layers you are building public ? if so, I can try with your exact
> setup and see if I can reproduce the issue.

unfortunately, no. Denys and I are trying to figure our how to make
our private layer public in a manner that others can work with as
well.. but not yet.. we are still a few weeks or months away..

Let me try the reverse and try and reproduce your setup on my end and
see where the deltas are.. That might be more practical, I think..


Thanks for your time and hints.. I need to do more homework here..

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

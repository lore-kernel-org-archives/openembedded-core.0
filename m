Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8A2776E2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 10:08:02 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u87A7xKD029039
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2016 12:07:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1473242880;
	bh=xY3nMIpta6CbopTrirju/3ET/aRhvsv4enSFA5WoKpU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=VWjZXnQ+0g4FkKU9sktMfXb8FwRxDl1KQA3zs/P5i+26lGaPM/XFCSG04BR+Qr8MT
	K6nIrntQmpbUsL54xYadSsXxKHivjG6DWo0Ee26zPnbCfJeCJDDzTECVethry35Gsu
	4/lE2Hjox69VY+sRMAhVi+PzpEE4ZpesESkgpzIM=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u87A7fBm002578 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Wed, 7 Sep 2016 12:07:41 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 77DA30ABD49;
	Wed, 7 Sep 2016 12:07:07 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u87A7cA7002575
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 7 Sep 2016 12:07:38 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1bhZla-0006mz-Mk; Wed, 07 Sep 2016 12:07:38 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
	<d4044adfd000c8b67ed9b523bfbfc49ca97e8fa7.1473155977.git.paul.eggleton@linux.intel.com>
	<lywpipvxhx.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1844223.HiLeg694VU@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 07 Sep 2016 12:07:38 +0200
In-Reply-To: <1844223.HiLeg694VU@peggleto-mobl.ger.corp.intel.com> (Paul
	Eggleton's message of "Wed, 07 Sep 2016 08:16:12 +1200")
Message-ID: <lyshtcvx91.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.8
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/9] lib/oe/patch: handle non-UTF8 encoding when reading patches
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
X-List-Received-Date: Wed, 07 Sep 2016 10:08:04 -0000
Content-Type: text/plain

Paul Eggleton <paul.eggleton@linux.intel.com> writes:

>> I would read the file as a binary ('rb' instead of 'r') and make the
>> GitApplyTree.* strings a 'bytes' type.
>
> The code is not just passing the data through, it is actually processing
> it.  If we did what you propose wouldn't it make that processing more
> difficult?

Should not be very much... You have to write b'foo' instead of 'foo' at
some places, but things like 'file.readline()' or 'line.startswith()'
are still working with 'bytes' resp. binary files.

Only when trying to print them on stdout, things can get nasty.  But
this should not be needed for patches.


Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz


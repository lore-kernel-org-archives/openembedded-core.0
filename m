Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 461FE616F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 11:52:08 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rALBq4YY010473
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 12:52:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1385034726;
	bh=vkUHyGogJMykQxHhYKX763/Hkgl0dHZ0qDgzcLVM6Pk=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=fzX8MgzG/Di+t68Pw1gaA8aHEjj8V9OmwPooZnKBmvWwjcZl1vaWFw9Oz/taey9Tv
	4Q0v2BP2KfZ2ll9yPt2CUeJcJ9Kstj8hW6Otdagj2XxXIeeNC3YoEwwnV6t18/Iqda
	Ba+Gf0XH7XbHDD3YLWjYBx4jIXgZGSNcJ08/zDCM=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rALBpwBa010916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 12:51:59 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VjSne-00063V-6X
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Nov 2013 12:51:58 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <528D2429.7040705@emagii.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 21 Nov 2013 12:51:57 +0100
In-Reply-To: <528D2429.7040705@emagii.com> (Ulf Samuelsson's message of "Wed, 
	20 Nov 2013 22:05:45 +0100")
Message-ID: <ly61rmt1k2.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.82
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: Improving Build Speed
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
X-List-Received-Date: Thu, 21 Nov 2013 11:52:10 -0000
Content-Type: text/plain

Ulf Samuelsson <angstrom-dev-AoFPY8dbyRPQT0dZR+AlfA@public.gmane.org>
writes:

> PARALLEL_MAKE = "-j6"
> BB_NUMBER_THREADS = "24"

I define

| PARALLEL_MAKE = "\
|   -j ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 2} \
|   -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100} \
| "
| 
| BB_NUMBER_THREADS ?= "\
|   ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100}"

in my global configuration (note the '-l').  I would like to limit it by
the available RAM size (e.g. one -j per GB) but BB_NUMBER_THREADS makes
it difficultly to express it.  There are also dependencies on the used
filesystem (e.g. btrfs performance seems to degrade rapidly with higher
-j).

It would be perfect when bitbake takes the role of the toplevel
jobserver[1] but that's probably very difficultly to implement and
might interfere with recursive make.


> and was quicker, but it seemed to be a little flawed.  At several
> times during the build, the CPU frequtil showed that most of the cores
> went down to minimum frequency (2,93 GHz -> 1,6 GHz)

Capturing resource usage (--> getrusage(2)) will give more details
(e.g. about i/o load). E.g. see

             https://www.cvg.de/people/ensc/oe-metrics.html



Enrico


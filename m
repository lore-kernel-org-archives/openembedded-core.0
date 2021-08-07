Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.7567.1628349962746655207
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 08:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:55420 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mCOD5-0006xT-L0
	for openembedded-core@lists.openembedded.org; Sat, 07 Aug 2021 11:26:01 -0400
Date: Sat, 7 Aug 2021 11:25:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: would reducing BB_NUMBER_THREADS solve parallelism overheating?
Message-ID: <d21730c5-d43-dfba-89bc-71d113f049e9@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  i've asked about this previously, but i finally got around to
thinking about this in detail, and i'd like some feedback.

  i've described the overheating/lockup issues i've been having on a
dell latitude laptop building a sizable (wind river linux-based) image
represented by 5-6000 tasks.

  if i start the full build from scratch, it would take about 2 hours
if it succeeded but, on a very regular basis, when the load average
well exceeds 120 and i can feel really hot air blowing (even with t
laptop cooler), the laptop will simply lock up hard.

  the CPU is a i7-9850H, so 6 cores/12 threads, and i've refactored
numerous proprietary in-house recipes to really crank up the
parallelism so that, a lot of the time, i can see all 12 threads
churning away on some task. of course, that's exactly when i get the
huge load average/overheating/lockup.

  a couple colleagues suggested using BB_NUMBER_THREADS (BNT for
short) to dial things back a bit but, after i pondered a bit, it seems
that that would potentially make things worse, not better, so a couple
questions about cores and threads.

  first, given the CPU setup, let's say i set BNT to 6. does that mean
3 cores would be taken out of play entirely, leaving the other 3 to do
all the work, or would each core simply use one thread, or who knows
what would happen, and would any one scenario be superior to another?

  my other realization(?) is that reducing BNT might be the *worst*
strategy, and here's why. if i have a huge load average, that suggests
i have lots and lots of tasks waiting to run (lots of stuff on the
wait queue). but if i reduce the number of available threads, wouldn't
that just force all that work to wait for a smaller number of threads,
making the wait queues even longer?

  i'm open to being educated on how all this works.

rday

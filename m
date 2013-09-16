Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id D2E146C84E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 18:06:54 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r8GI6rQT028464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 20:06:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1379354815;
	bh=2L+qZg4++DTBg1j4kNJhsqLVNUk9cc6FwV0ZwBLaR4Q=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=ZWbpR8fqJEvANLLTC7PClIH6/caxF0r+apMVE3sxDSNG3cA9jCpJcBlk46FI8h7FX
	XOqFnEBp9DIHm9m79yDAhLqigXVvXsTe9bAuLD0Y/JKIwmxq+mw+YlZZ9vig6dhcRf
	mYFsn7RW9D+mAWCyrij9aASPnY27sSdn1l5hCpuA=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r8GI6nYX028898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 20:06:50 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VLdCB-0003i1-UQ
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Sep 2013 20:06:49 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1378452180-2872-1-git-send-email-jukka.rissanen@linux.intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 16 Sep 2013 20:06:46 +0200
In-Reply-To: <1378452180-2872-1-git-send-email-jukka.rissanen@linux.intel.com>
	(Jukka Rissanen's message of "Fri, 6 Sep 2013 10:23:00 +0300")
Message-ID: <ly7gegd4jt.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH] connman: Ignore the NFS root network interface in init script
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
X-List-Received-Date: Mon, 16 Sep 2013 18:06:55 -0000
Content-Type: text/plain

Jukka Rissanen <jukka.rissanen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
writes:

> The connman init.d script tried to ignore all the network interfaces
> if NFS root is configured. We should only ignore the interface that is
> used by NFS root.

This does not really work; e.g. here:

1. the cmdline is 'ip=dhcp' and won't be detected by your expression

2. system needs information from dhcp for DNS and NTP

3. system must renew the DHCP lease periodically


I wrote

   https://www.cvg.de/people/ensc/0001-added-noipconfig-option.patch

which fixes the last two issues (it's probably too invasive and specific
to be applied upstream).  I do not think that point 1 can be solved in a
generic way but requires some customization.



Enrico


Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id D9BCF6BDAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 15:34:22 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r8IFYKId017371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 17:34:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1379518463;
	bh=Thm/WRWQol32ar3O8fvC7cFbAHMx4dCCZi35LXjD5Kg=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=pLhczFYNku2akIICn9PeK9zjc3k+Lc5Mm6+nRQjwWigEKlajsDVWpT4ydEayBuaU4
	z6q7/AKYU1Vughk2kH3b013dQjM4Wv/a0JoDkH/FyGmHtQswL1ypnj9UsaSVHqu1KI
	hgLGvFd56T8LcsJjvxqwIb1XevKF4tf6IpIdX288=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r8IFYGGk030995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 17:34:17 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VMJlf-00077I-LQ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Sep 2013 17:34:15 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 18 Sep 2013 17:34:15 +0200
In-Reply-To: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	(Otavio Salvador's message of "Wed, 18 Sep 2013 10:51:04 -0300")
Message-ID: <lypps6ta88.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 15:34:24 -0000
Content-Type: text/plain

Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org> writes:

> +# The LDFLAGS is required or some old kernels fails due missing
> +# symbols and this is preferred than requiring patches to every old
> +# supported kernel.
> +LDFLAGS="-ldl -lutil"

LDFLAGS is usually the wrong variable for extra libs (it might conflict
with '-Wl,-as-needed' or lib-grouping).  Adding new libs to perf seems
to require the modification of EXTLIBS because of

| LIBS = -Wl,--whole-archive $(PERFLIBS) -Wl,--no-whole-archive -Wl,--start-group $(EXTLIBS) -Wl,--end-group
| ...
|$(OUTPUT)perf-%: %.o $(PERFLIBS)
|	$(QUIET_LINK)$(CC) $(ALL_CFLAGS) -o $@ $(ALL_LDFLAGS) $(filter %.o,$^) $(LIBS)



Enrico


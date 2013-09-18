Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5206BDAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 15:19:51 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r8IFJlZi017345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 17:19:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1379517592;
	bh=ZyIgpDvJWujBMr0PLcT2BOqL81UFDT2AzmQ7boSNx1g=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=enRd8FmA/ZgXEdU/MovRpzHNlDe2RpEijUUDGC4Pb0A5CS+kcBDWZCQuhVhaPdtu2
	WUFgneBoS+kIlAwDQ60g4LECN5omvd3wtWzsQNjD/p8Sc2xFu00aTqIK7XWVOEhbca
	GkI7xbGIEGSGYOxb3U3mpBdfa82D3OxnInrnkzo0=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r8IFJgsk029521
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 17:19:44 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VMJXa-00069Z-JW
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Sep 2013 17:19:42 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
	<ly38p2urzf.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 18 Sep 2013 17:19:42 +0200
In-Reply-To: <CADkTA4N+LdRpRW-497U0K8ZTFbFvy5Yr+2QznKbcg0yxSaBPww@mail.gmail.com>
	(Bruce Ashfield's message of "Wed, 18 Sep 2013 10:39:35 -0400")
Message-ID: <lytxhitawh.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Wed, 18 Sep 2013 15:19:53 -0000
Content-Type: text/plain

Bruce Ashfield <bruce.ashfield-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

>>> +LDFLAGS="-ldl -lutil"
>>
>> What is with -Wl,-as-needed or the gnu-hash ldflags which are applied
>> usually?  Perhaps, hacks like
>
> We don't want to influence the perf build from the build system, unless we
> absolutely have to. We want to use the flags and configs that are contained
> within the kernel, just as we do with anything from the kernel tree in
> general.

Userspace programs should always be built with optimization flags of the
build system.  E.g. it would be wrong when packages override our idea of
optimization (-Os/-O2/-O6), generation of debug symbols or stripping of
debug symbols.

Kernel itself is an exception because it is tied very much to gcc and
its behaviour.  But things like

| CFLAGS = -fno-omit-frame-pointer -ggdb3

in the perf Makefile must be overridable by the build system.



Enrico


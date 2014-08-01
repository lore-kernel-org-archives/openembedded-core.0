Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3F0708A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Aug 2014 09:22:21 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s719MJlj029891
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 11:22:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1406884940;
	bh=fbrTgFs6HbyrXFUn7/agjm86+LT5ubQFJdIJIr3bsms=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=TyIF+k6IuxWHgp6Vcwk0X4Vd3nOSn4XHfnq+nxzLQspoFHeS7IZvQZ6Wpo6G293KC
	IGhjLChGfT2Fq01+gZfqa4XBo23fjN4TPVuP5nZ61T9AXZI9LnpyVUrqFAvi1moSdi
	XXt4aY8A8TDJpibj7ipCIO61eAocgdBHHuPL//0c=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s719MF6S017108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Aug 2014 11:22:16 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XD92V-0000bM-36
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Aug 2014 11:22:15 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1406818740-17681-1-git-send-email-sujith.h@gmail.com>
	<ly8un9biuj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAP9ODKpYgA9jQ2u4Nwh2=+NoQJcZiydtZdkDu0-jvnKfZxHvvg@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 01 Aug 2014 11:22:15 +0200
In-Reply-To: <CAP9ODKpYgA9jQ2u4Nwh2=+NoQJcZiydtZdkDu0-jvnKfZxHvvg@mail.gmail.com>
	(Otavio Salvador's message of "Thu, 31 Jul 2014 17:44:02 -0300")
Message-ID: <lyy4v8imyg.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH] netbase: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Fri, 01 Aug 2014 09:22:25 -0000
Content-Type: text/plain

Otavio Salvador <otavio-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org> writes:

>>> +     echo 127.0.1.1 "             "${MACHINE} >> ${D}${sysconfdir}/hosts
>>
>> This is a very questionable setup which causes a lot of harm.  When
>> really wanted, it should be made optional and not the default.
>
> What kind of harm you see?

e.g. in sshd_config

| ListenAddress <hostname>


When Fedora had such a setup, I had a lot of trouble with KRB5ized
NFS4. See [1] for examples. Generally, external and internal DNS should
be consistent.

Beside this... afaik ${MACHINE} can contain '_' and '.' which are either
forbidden ('_') or have special meanings in DNS.


Enrico

Footnotes: 
[1]  https://bugzilla.redhat.com/show_bug.cgi?id=648725


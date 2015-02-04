Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 1FCA4606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 17:59:32 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	t14HxQhZ023560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 4 Feb 2015 17:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1423072770;
	bh=GppyMqidJHsLojum221ucWuXwQEi/Wb5kMyih2SG2Ak=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=E+7kalShkt6c32/11Nm7gOHNBbAY0/FMeqpl5QB8tYp4FmF0iVvjKNLmTFTL69mMo
	uAnM6WEiblUod+Tq6P2FqzTf7L7TPhv41AOU+j3fLCYbVKx4nbpy32/UafWN8A2Gdo
	PFrDUUn+725Fr/LwUJ5VEePGF6ZgeERLQEjQ1IyY=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id t14HxK31024072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Wed, 4 Feb 2015 18:59:21 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.84) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1YJ4EY-0005Lu-W1; Wed, 04 Feb 2015 18:59:27 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Bottazzini\, Bruno" <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1422987664-26903-1-git-send-email-bruno.bottazzini@intel.com>
	<1422987664-26903-2-git-send-email-bruno.bottazzini@intel.com>
	<lytwz1zylo.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20150204150403.6de4ae70@bottazzini-ThinkPad-T430>
Date: Wed, 04 Feb 2015 18:59:26 +0100
In-Reply-To: <20150204150403.6de4ae70@bottazzini-ThinkPad-T430> (Bruno
	Bottazzini's message of "Wed, 4 Feb 2015 15:04:03 -0200")
Message-ID: <ly8ugdy2v5.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: update version from 216 to 218
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
X-List-Received-Date: Wed, 04 Feb 2015 17:59:43 -0000
Content-Type: text/plain

"Bottazzini, Bruno" <bruno.bottazzini@intel.com> writes:

>> > +FILES_${PN}-services-ask-password = "\
>> > +        ${rootprefix}/bin/systemd-ask-password \
>> > +        ${rootprefix}/bin/systemd-tty-ask-password-agent \
>> > +
>> ...
>> I think, enumerating services in this kind becomes a maintenance
>> nightmare.  E.g. you have to check for every future systemd version
>> whether service gets listed in a new .wants.  Using wildcards can
>> simplify this; e.g. see systemd_elito_populate_packages() in
>> 
>>           https://www.cvg.de/people/ensc/systemd_216.bbappend
>
> On your example, wouldn't we have to enumerate the packages too ?

I do not have a catch-all package (like your '${PN}-services-essential');
the subpackages are announced by

| PACKAGES_DYNAMIC += "${@systemd_elito_populate_packages(d, True)}"

and I add manual RRECOMMENDS in the toplevel machine task recipe.


But it should be trivial to add dependencies within the
systemd_elito_populate_packages() function; e.g.

|  d.setVar("RRECOMMENDS_something", ' '.join(map(lambda x: '${PN}-' + x, pkg_info.keys())));


> Where did you get this file ?

It is used in our distribution and its roots are before 2012...  I never
had time to clean it up, especially because it is very controversial
(upstream systemd is against splitting units[1])



Enrico

Footnotes: 
[1] http://comments.gmane.org/gmane.linux.redhat.fedora.devel.announce/1450


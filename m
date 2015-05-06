Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 88B0073755
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 19:12:45 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so21975331wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 12:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hLPetjrks3RX8Q5fXBNzPD+WdK+2H/0Ua6Ik1QmYEwc=;
	b=VDonKgG7Rww9ro000ih4jNqhb/+yjlbirsaMOJZVzeh/kwecP7Crr8321gtRTXURqJ
	6hSjbe8CCHxZlNWti/vNYbXAAx6KMTQACqhAeBbSiCqBJBy31rooqfLb+GvNwUWcLPWS
	JWHuueuLX3LeD/tJRE9ELI+ZTVzE0H3DRiPQFW5r9q04WyxM/tou5LrhYpOxSEtKbVjp
	VgiNuRFtKt9uRaUVwfdUCA/Ek/mhi1snd2coMQdmQ3gbYgy5IspA+vDtKfS2Lf88qnr3
	+NuPn1veLWI46Hkwfoyv3mWp/5oixrWateQFnrZGmSnM57sk/ZF6w7q7pWy4RulQuKXv
	bNig==
X-Gm-Message-State: ALoCoQlyMnP8Mw/sog7cBJO5DSGH0Lfrh6ogi+5m6bUGxAqVWlzauP0QcirK2Z3n72q2d8OsykcV
X-Received: by 10.194.63.9 with SMTP id c9mr303986wjs.143.1430939566686;
	Wed, 06 May 2015 12:12:46 -0700 (PDT)
Received: from ?IPv6:2001:bf0:c080:401::2? (wiki.deck1.zone42.org.
	[2001:bf0:c080:401::2])
	by mx.google.com with ESMTPSA id dl2sm3546036wib.2.2015.05.06.12.12.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 12:12:45 -0700 (PDT)
Message-ID: <554A67AB.1000800@dresearch-fe.de>
Date: Wed, 06 May 2015 21:12:43 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>, Denys Dmytriyenko <denis@denix.org>
References: <20150501160602.GA5885@denix.org>
	<CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
In-Reply-To: <CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Wed, 06 May 2015 19:12:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Am 02.05.2015 um 23:55 schrieb Andrea Adami:
> On Fri, May 1, 2015 at 6:06 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> Has anyone ever seen this message during <image>.do_rootfs task?
>>
>> Collected errors:
>>  * opkg_install_pkg: Package <package> md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
>>  * opkg_install_cmd: Cannot install package <package>.
>>
>> We started seeing it on random packages inside the <image> few weeks ago on
>> different machines. At the time we had switched to bitbake 1.26. But even
>> trying different bitbake versions still occasionally caused the same error, so
>> the culprit is still unknwon. Using oe-core/daisy for now.
>>
>> Any comments or suggestions to where start looking would be appreciated!
> 
> yes, I have seen this during multimachine builds.
> My TMPDIR is on tmpfs in ram so everytime I reboot it is re-populated
> from sstate.
> ...

We have the same problem here. Also with packages from the "all" feed in a multimachine build environment. But it does not seem related to packagegroups.

I've a hypothesis but was not able to validate or falsify it till now: Given a recipe which does only use file:// type SRC_URI. If i change something in these sources and do not update PR the prserv/hashing mechanism detects the changes a builds a new package. But this package has the same version info as the one before. So for opkg there's no need to update it's "package database".

As said before this is just a hypothesis.

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PxP7b-0006rW-DM
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 20:32:43 +0100
Received: by wyb40 with SMTP id 40so755201wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2011 11:30:59 -0800 (PST)
Received: by 10.216.142.199 with SMTP id i49mr5369862wej.33.1299699058260;
	Wed, 09 Mar 2011 11:30:58 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t5sm1085688wes.9.2011.03.09.11.30.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Mar 2011 11:30:57 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299697497.602.866.camel@rex>
Date: Wed, 9 Mar 2011 20:30:56 +0100
Message-Id: <3FBA67DC-6150-4EFE-A5C4-57D895BA697D@dominion.thruhere.net>
References: <4D6675E0.2040703@mlbassoc.com> <4D6B3BA3.9050303@intel.com>
	<4D6F9018.1000605@mlbassoc.com> <4D704768.2090100@intel.com>
	<4D70CE46.7040104@mlbassoc.com> <1299634187.602.546.camel@rex>
	<4D77C9F9.4040309@mlbassoc.com> <1299697497.602.866.camel@rex>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1082)
Cc: Poky <poky@lists.pokylinux.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Is sstate broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Mar 2011 19:32:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mrt 2011, om 20:04 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-03-09 at 11:42 -0700, Gary Thomas wrote:
>> I updated to master (fab742bd4693ed3092690a20dd32d53fe27c3d4c) and =
tried again.
>> I don't see any difference - the run using the sstate cache as a =
mirror
>> seems to do all the same work as without.  Here's how I tested it.
>>=20
>> * Build original tree
>>   % POKYCONF=3Dmeta-cobra3530p60/conf . =
/tmp/poky-amltd/poky-init-build-env /local/p60_step1
>>   ... adjust conf/local.conf
>>   % bitbake amltd-console-image
>>=20
>> * Rebuild, using previous result for SSTATE_MIRRORS
>>   % POKYCONF=3Dmeta-cobra3530p60/conf . =
/tmp/poky-amltd/poky-init-build-env /local/p60_step2
>>   ... adjust conf/local.conf
>>   % bitbake amltd-console-image
>>=20
>> The only difference between the two runs is enabling SSTATE_MIRRORS =
in local.conf
>>   %  diff -u /local/p60_step?/conf/local.conf
>>    --- /local/p60_step1/conf/local.conf    2011-03-09 =
08:28:18.266933061 -0700
>>    +++ /local/p60_step2/conf/local.conf    2011-03-09 =
09:57:51.365932951 -0700
>>    @@ -53,4 +53,7 @@
>>     IMAGE_LINGUAS ?=3D "en-us"
>>=20
>>     # Minimize feature set
>>     DISTRO_FEATURES ?=3D "alsa"
>>    +SSTATE_MIRRORS ?=3D "\
>>    +file://.* file:///local/p60_step1/sstate-cache/"
>>=20
>> The results seem to have gone through all the same steps (or nearly =
so).  The output
>> from the runs is at
>>   http://www.mlbassoc.com/poky/build.step1
>>   http://www.mlbassoc.com/poky/build.step2
>>=20
>> Comparing the two build trees:
>>   % ls /local/p60_step1/tmp/work/*/*/temp/log.do_compile | wc
>>     144     144   12521
>>   % ls /local/p60_step2/tmp/work/*/*/temp/log.do_compile | wc
>>     143     143   12427
>>   % du -s /local/p60_step?
>>   15229296        /local/p60_step1
>>   15162760        /local/p60_step2
>>=20
>> I know this procedure used to work (or at least close).  Am I doing
>> something wrong?
>=20
> You're not doing anything wrong and this is the same scenario I've =
been
> testing with. After I'd fixed the origin problem it created a problem
> with file urls containing globing. I managed to break the original =
patch
> with the globing fix. The good news is the problem is simple and I've
> pushed a fix.

Is that fix in oe-core as well?

regards,

Koen=



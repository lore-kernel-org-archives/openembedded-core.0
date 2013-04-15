Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1URm4J-0004jb-Rd
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 18:15:52 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r3FFwDIJ005494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 15 Apr 2013 17:58:14 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1URlnI-00065L-H7; Mon, 15 Apr 2013 17:58:12 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1365697555.git.ross.burton@intel.com>
	<lyli8k12k3.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<155F9D05-94DF-4B6B-8CC7-E75D22696C81@dominion.thruhere.net>
	<1366038901.8670.53.camel@ted>
Date: Mon, 15 Apr 2013 17:58:12 +0200
In-Reply-To: <1366038901.8670.53.camel@ted> (Richard Purdie's message of "Mon, 
	15 Apr 2013 16:15:01 +0100")
Message-ID: <lyip3nzsyz.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Move systemd binaries to /sbin/systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 16:15:59 -0000
X-List-Received-Date: Mon, 15 Apr 2013 16:15:59 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> >> Following the example set by udev, move the binaries to /sbin/systemd
>> >> and hardcode less paths in general.  Tested on atom-pc with a .hddimg
>> >> so the live boot/initrd paths were tested.
>> > 
>> > At least the moving of udev breaks a lot of local recipes here which
>> > install e.g. local rules or keymaps in /lib/udev.  This is a silent break
>> > which is detected at device runtime only.  The global 'bitbake.conf' has
>> > not been updated for the new paths neither.
>> > 
>> > 
>> > There should be:
>> > 
>> > 1. added some QA checks which detect this broken packaging
>> > 
>> > 2. added some global variables (e.g. 'udev_basedir') which can be used
>> >   in the rules.
>> 
>> These patches can get NAK'd all you want, but they will go in. I still
>> say: NAK, this is a bad, bad idea. It diverges from upstream and
>> introduces silent breakage as you point out due to that.
>
> In the 1.5 timeframe I want to look at this again and see how we can
> better solve it as it may be we can do something to the multilib code to
> avoid the issues. We ran out of runway with this for 1.4 :(.

Does this mean, this last-minute and invasive patch gets reverted (-->
it is already in oe). Or, that it stays and we have to live in 1.4 with
bad surprises[1] because an undefined number of packages[2] uses still
the upstream defaults?



Enrico

Footnotes: 
[1]  udev rules, keymaps and firmware at the wrong location

[2]  surprisingly, 'systemd' itself where this change has been applied
     still refers to /lib/udev/rules.d




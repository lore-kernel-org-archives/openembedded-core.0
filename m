Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UFMec-0005cW-46
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 11:42:08 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r2CAP8Iq019550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Mar 2013 11:25:09 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UFMOJ-0003jO-UE; Tue, 12 Mar 2013 11:25:08 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
	<69be0b1aae50eb097172bcfa2e9aa02157f62436.1360499939.git.enrico.scholz@sigma-chemnitz.de>
	<1362570557.11727.59.camel@ted>
Date: Tue, 12 Mar 2013 11:25:07 +0100
Message-ID: <lya9q8ud8c.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.6
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] package.bbclass: use oe.path.realpath()
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
X-List-Received-Date: Tue, 12 Mar 2013 10:42:11 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> Old implementation suffered from lot of problems; e.g.
>> 
>> * redundant code
>> 
>> * calls 'os.stat()' which references files on host; this can give wrong
>>   results about existing/non-existing and can cause EPERM (instead of
>>   the catched ENONENT) exceptions
>> 
>> * does not deal with special cases like '..' leaving the sysroot.
>
> Whilst these changes are good, they do come at a cost:
>
> post symlink package changes
> ./perfscript -c 8c22531e491e6b0cfffaaa80d6bc75db757fc1d1
> 49:38.46,17:12.15
>
> pre symlink package changes
> ./perfscript -c 1a80329b3fcf23ecc23e409a260b9b2182652f65
> 48:16.33,13:39.97
>
> So it added 1m20 to the overall build time, but more worryingly, added
> added nearly 3m30 to the time for:
>
> bitbake virtual/kernel -c cleansstate; bitbake virtual/kernel
>
> These tests are based on the script linked from
> https://wiki.yoctoproject.org/wiki/Performance_Test where the kernel
> test is this is the second number above list, overall build time is the
> first.
>
> Have you any time to look into this performance regression?

Well, patch replaced a call to os.path.realpath() with a more accurate
variant honoring a sysroot. There must be more work be done to replace
things previously solved by the operating system with custom (python)
code.

I will try to write a C implementation of oe.path.realpath() but this
can take some time and I do not have an idea how to integrate it into
oe.


Enrico



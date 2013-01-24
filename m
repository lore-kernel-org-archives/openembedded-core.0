Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TyM26-0001Ts-R6
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:35:54 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0OCKKvc019112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:20:21 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1TyLnD-0008Au-Dv
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:20:31 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <50FFFF81.8010203@communistcode.co.uk> <510102F4.70108@intel.com>
	<CAJTo0LZfGGSdQwKMshr8PNUVZfk4Nwhr67-9iFbGw2=V=YqN8g@mail.gmail.com>
	<510124FE.6040901@intel.com>
Date: Thu, 24 Jan 2013 13:20:31 +0100
In-Reply-To: <510124FE.6040901@intel.com> (Radu Moisan's message of "Thu, 24
	Jan 2013 14:11:42 +0200")
Message-ID: <lyd2wug4c0.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.84
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: systemd: /run directory not created
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
X-List-Received-Date: Thu, 24 Jan 2013 12:35:54 -0000
Content-Type: text/plain

Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

>>> Possibly because /run was a link created by the initscripts which
>>> are now disabled when systemd is the init manager. I'll look into
>>> this and update 00-create-volatile.conf so that systemd will handle
>>> the link creation in stead.
>> I wonder how my images booted...  initscripts is sysvinit specific,
>> the systemd startup should handle this somehow.
>>
>> (insert standard argument that we should adopt /run across all init
>> systems)

yes; that's the best way.  Make /var/run a symlink pointing to /run.


> This is exactly what I was looking for. /run shouldn't be there, yet
> somehow it is. I was looking into how/where systemd is creating /run
> but no lead for now.

/run is part of systemd's api and mounted very early internally by
systemd.  This mountpoint must exist in the filesystem and it will
probably not work when it is symlink into /var/volatile which gets
mounted later.


Enrico



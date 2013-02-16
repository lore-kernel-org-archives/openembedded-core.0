Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U6e7K-0004m3-NR for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 10:31:35 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1G9Ld9m000868; Sat, 16 Feb 2013 09:21:39 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zy+vAsUBVeRO; Sat, 16 Feb 2013 09:21:39 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1G9LY6k000852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 16 Feb 2013 09:21:37 GMT
Message-ID: <1361006114.31795.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Sat, 16 Feb 2013 09:15:14 +0000
In-Reply-To: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFE: make the init manager an image feature (again)
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
X-List-Received-Date: Sat, 16 Feb 2013 09:31:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-02-15 at 19:19 +0100, Enrico Scholz wrote:
> it would be nice when the decision to make the init manager a distribution
> feature will be reverted to the old oe-meta mechanism.
> 
> Being a distribution feature means, that packages are created in such a
> way that it is impossible to split off unwanted and heavy weighted
> functionality at image creation time.
> 
> E.g. on most of my systems, I create two kinds of images: a full
> featured, systemd based one and a very minimal rescue system with
> busybox and some filesystem utilities.  With recent systemd packaging
> change, the rescue image size grow up from 5.9 MiB to 27 MiB because
> systemd dependencies are hardcoded in mandatory packages.
> 
> Formerly, systemd dependencies could be avoided by adding the -systemd
> packages to BAD_RECOMMENDATIONS (e.g. due to busybox-syslog ->
> busybox-syslog-systemd rrecommend).
> 
> I am aware that initscripts were always part of the main package.  But
> sysvinit was very lightweighted and the extra space either negligible or
> easy to recover by removing some files in IMAGE_PREPROCESS_COMMAND.
> 
> Hence my recommendation: make the init manager an image feature again
> and create -systemd and -sysv packages with the corresponding scripts.
> OpenEmbedded is still for embedded devices where size matters.
>
> Of course, systemd can be still a distribution feature to enable things
> like socket activation as part of PACKAGE_CONFIG.  But dependencies on
> init system packages should be RRECOMMENDS which can be overridden
> easily at image creation time.

The trouble is that by making it an "image feature", people will expect
*everything* to work properly and to be able to have fully functional
sysvinit and systemd variants of images. We already see this
expectation. Trying to explain to people what the limitations are, what
is expected to work and what isn't will be difficult. I know you
understand this but going forward most people will simply not and I
think it will be a nightmare for usability.

For that reason I'd rather see this done in a different way, for example
blacklisting the problematic systemd dependencies at image generation
time with some kind of stronger BAD_RECOMMENDS code. Yes, this means
there would be some systemd config files lying around but you'd stop the
main bulk of it coming in (and as you said, some small config files
aren't an issue).

Cheers,

Richard





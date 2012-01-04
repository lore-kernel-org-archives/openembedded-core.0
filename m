Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RiSWN-0001yh-8g
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 16:12:55 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RiSPH-0002Iu-Rq
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 16:05:35 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 15:05:34 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325689535.28005.59.camel@phil-desktop>
Mime-Version: 1.0
Subject: sstate compression
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
X-List-Received-Date: Wed, 04 Jan 2012 15:12:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Has anybody experimented with the effects of using different/no
compression for the sstate packages? 

I happened to notice that, for one of my builds, oe was spending a
noticeable amount of time gzipping the tarfiles for sstate.  Obviously
this indicates that I should get myself a better computer, but I do
wonder whether there is a different tradeoff that can be made here.

Taking one of my webkit sstate archives as an example, the uncompressed
tarfile is 112M. 

gzip (default compression) reduces this to 28M in about 4.2 seconds.
gzip -1 reduces it to 33M in about 1.75 seconds.
lzop reduces it to 40M in about 0.75 seconds.

Presumably the same sort of considerations apply to the compressed data
inside .ipks, though of course the file sizes there tend to be rather
smaller so I guess the impact is less.

I'm currently setting GZIP="-1" in my local configuration since that's
easy to arrange and seems to produce a worthwhile benefit.  It's not
totally obvious to me whether switching to lzo would be a net win or a
loss, but either way this would involve hacking sstate.bbclass and I was
too lazy to do that so far.

p.





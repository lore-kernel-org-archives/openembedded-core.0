Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QPyfc-0000FV-2b for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:09:48 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QPycf-00067K-Er
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 17:06:45 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306452822.27470.220.camel@rex>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<1306452822.27470.220.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Fri, 27 May 2011 16:06:44 +0100
Message-ID: <1306508804.2525.460.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Fri, 27 May 2011 15:09:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 00:33 +0100, Richard Purdie wrote:
> I talked about this on IRC but simply put, no way.
> 
> The problem is:
> 
> a) Arm specific
> b) determined now to be armv7 specific
> c) gcc version specific
> 
> and the fix should reflect this.

From a fairly superficial look at the crash I suspect you probably want
something like:

--- arm.md~	2011-05-27 15:18:31.916926254 +0100
+++ arm.md	2011-05-27 15:31:57.331525688 +0100
@@ -4213,7 +4213,9 @@
    uxth%?\\t%0, %1
    ldr%(h%)\\t%0, %1"
   [(set_attr "type" "alu_shift,load_byte")
-   (set_attr "predicable" "yes")]
+   (set_attr "predicable" "yes")
+   (set_attr "pool_range" "*,256")
+   (set_attr "neg_pool_range" "*,244")]
 )
 
 (define_insn "*arm_zero_extendhisi2addsi"

It also looks like this could happen on ARMv6 as well, for what that's
worth, though I haven't tested to see whether it actually does or not.

p.





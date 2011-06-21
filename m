Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QZ8vb-00080L-Gs for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 23:56:11 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QZ8sC-0002rO-5C
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 23:52:40 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E010FF4.2070102@windriver.com>
References: <4E00CA30.7020302@windriver.com>
	<1308682643.3083.18.camel@lenovo.internal.reciva.com>
	<4E00ED2C.1040708@windriver.com>
	<7E1967A9-8BDC-4B6D-85FB-0232590DD15A@dominion.thruhere.net>
	<4E010FF4.2070102@windriver.com>
Date: Tue, 21 Jun 2011 22:52:34 +0100
Message-ID: <1308693154.3083.89.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Directory permissions and ownership -- RFC
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
X-List-Received-Date: Tue, 21 Jun 2011 21:56:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 16:41 -0500, Mark Hatle wrote:
> Unfortunately it won't work as the umask would only be set in the "mytask" -
> task.  It needs to be set in all of the do_install and do_package tasks.
> 
> The only way to do this (from what Chris L told me) is to setup an event handler
> and set the umask when we get into specific events.  I'm not sure if I could
> correctly capture do_install and later.. plus if someone did what you are
> mentioning, then it would no longer be in the umask 022.

I think you could probably fix do_install by wrapping it in a python
method.  That is, something along the lines of:

python do_wrapped_install() {
	os.umask(022)
	bb.build.exec_func("install", d)
}
addtask wrapped_install after do_compile

and, obviously, remove the existing addtask for do_install.  You get the
idea, anyway.

For do_package and other tasks which come from classes within oe-core
itself, I continue to think that the right answer is just to fix the
classes to do the right thing.

p.




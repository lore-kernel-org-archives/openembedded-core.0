Return-Path: <walters@verbum.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 21D186BC98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:39:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id EE915215F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:39:18 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Thu, 29 Aug 2013 11:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:content-type:date
	:message-id:mime-version:content-transfer-encoding; s=smtpout;
	bh=1/irvIS16JosQNlRUOktDc+/1FE=; b=qknH3SpUhyATECQxufNhC4RYU1yi
	lqdBvT8PjM27K/MU88lKf5c67HHwduEaKPPQXi90sednrXQWYqQNHKwxng8zLItW
	87/zL/oudfIxpUbbL/eAn4EhqQBxIwrtyHm9kswPt+9JW+ox9bfggRaAxo+b5WrR
	jmDMwJ1rY6i3Oa0=
X-Sasl-enc: OcvksS8WbxqPokidjUkE/m407Gk8gQptPwqFg+w4bqI+ 1377790757
Received: from [10.16.197.114] (unknown [66.187.233.206])
	by mail.messagingengine.com (Postfix) with ESMTPA id B1BD66804EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:39:17 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 11:39:16 -0400
Message-ID: <1377790756.20072.50.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-21.el6) 
Subject: OSTree as an output target for OE
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
X-List-Received-Date: Thu, 29 Aug 2013 15:39:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

...is something I'd love to see.  I don't have much time in the
immediate future to work on it myself, but I'd just like to raise the
visibility of the project here because I am very much keeping in mind
the needs of embedded systems.  Or at least what I perceive them to be;
my job is not embedded, even though I use OE for a project.

In particular I know that while historically many embedded devices
aren't Internet connected, that's changing (which is a good and bad
thing).  But if your device will have the ability to upgrade itself
online, OSTree offers a model for completely atomic upgrades, which I
imagine is quite desirable for many unattended devices.

Here's a link to the LWN article:
http://lwn.net/Articles/564793/
Which links to my blog, but the most relevant thing here will probably
be:
https://people.gnome.org/~walters/ostree/doc/


Many of the changes it asks for:
https://people.gnome.org/~walters/ostree/doc/adapting-existing.html
are somewhat nontrivial from the current OE-core; but on the other hand,
it's not *that* far away.

The biggest technical change is having a new rootfs backend; I have a
truly hideous, hacky implementation here:
https://github.com/cgwalters/poky/blob/gnomeostree-3.10-dylan/meta-gnomeos/classes/gnomeos-contents.bbclass
which includes doing UsrMove (and further, unifying bin/sbin) etc. which
then generates two tarballs out of the OE content.  From there, I take
those two tarballs and commit it into an OSTree repository:

https://git.gnome.org/browse/gnome-ostree/tree/src/js/tasks/task-build.js?id=600ea8e70cf8c8bf56a79ad5ec39c122f9066a92#n1125

Then on the client side, users can choose between the refs
"gnome-ostree/buildmaster/x86_64-runtime" and
"gnome-ostree/buildmaster/x86_64-devel-debug" where the first is a
runtime system with no debuginfo, and -devel-debug has all of the
developer tools (gcc, make, etc.) and *all* of the debuginfo.

So you can see here the client machine can (relatively efficiently)
switch trees; it's not like images where you are locked into one thing.
It's also not like packages where you have a combinatorial explosion of
options.




Return-Path: <peter.kjellerstedt@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id 904846E30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 13:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id C3E941A01C;
	Thu, 16 Jan 2014 14:58:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 70WHDqoonExC; Thu, 16 Jan 2014 14:58:36 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 6875219E0D;
	Thu, 16 Jan 2014 14:58:31 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 141D9CC4;
	Thu, 16 Jan 2014 14:58:31 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id F2241A5E;
	Thu, 16 Jan 2014 14:58:30 +0100 (CET)
Received: from xmail3.se.axis.com (xmail3.se.axis.com [10.0.5.75])
	by seth.se.axis.com (Postfix) with ESMTP id EF9193E06F;
	Thu, 16 Jan 2014 14:58:30 +0100 (CET)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail3.se.axis.com
	([10.0.5.75]) with mapi; Thu, 16 Jan 2014 14:58:31 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jan 2014 14:58:31 +0100
Thread-Topic: RFC: Maintain backwards compatibility or not for
	module-base.bbclass
Thread-Index: Ac8SwwkG10iw4EZqQy+4iUHICRBSww==
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>
Subject: RFC: Maintain backwards compatibility or not for module-base.bbclass
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
X-List-Received-Date: Thu, 16 Jan 2014 13:58:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Background: Back in September, Richard made a commit to=20
linux-libc-headers.inc describing why one should not fork the=20
linux-libc-headers recipe:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dbabbf7a46acaefd=
9b36031483cafce053f607e66

As a result I created a local bbclass for our layer called=20
kernel-headers, which provides a recipe with kernel headers=20
that match the actually used version of the Linux kernel.
This was needed for packages that need to access hardware=20
specific features that are not present in the generic kernel=20
headers provided by linux-libc-headers.

My intention for this class was that it should be generic=20
enough to be able to upstream it to OE Core.

Now, the other day a colleague of mine had a build failure due=20
to this class. It turned out that even though the class adds a=20
dependency on virtual/kernel and then uses the files that are=20
installed to ${STAGING_KERNEL_DIR} when running oe_runmake=20
headers_install, the command could fail because the=20
${STAGING_KERNEL_DIR}/scripts was not populated. After asking=20
Richard about this, I learned that this is due to problems=20
with the sstate cache and not knowing whether a 32 bit host or=20
a 64 bit host was used to generate the files. Thus I also=20
learned that the scripts are actually built as a result of=20
building modules.

Since I did not want my class to depend on modules having been=20
built, I looked into modules.bbclass and modules-base.bbclass.=20
There I found the function do_make_scripts() which is=20
responsible for building  the kernel scripts. However, the=20
current setup doesn't lend itself very well to use the=20
modules-base.bbclass for something other than modules.

My idea then was to break this part out into a separate class,=20
kernel-scripts, which I did. You can find both the=20
kernel-scripts and kernel-headers classes here:=20

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dpkj/kernel-=
headers

When I showed this to Richard he noted that my change was not=20
backwards compatible (as I no longer provide the=20
do_make_scripts() function from the module-base.bbclass).=20
However, there is nothing besides module.bbclass in OE Core=20
and meta-oe that use the module-base.bbclass.

Anyway, I made a modified version that does maintain backwards=20
compatibility for module-base.bbclass here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dpkj/kernel-=
headers-backwards-compatible

This time Richard complained about the extra class=20
(kernel-scripts-base.bbclass), and noted that there was no=20
way to win... He then suggested that I take the question of=20
whether we need to maintain backwards compatibility for=20
modules-base.bbclass to the mailing list.

So, here I am now. I do not know who else use the=20
do_make_scripts() function from module-base.bbclass and in what=20
way, and whether restructuring the functionality into the new=20
kernel-scripts.bbclass without maintaining backwards=20
compatibility would be a problem. If you know anything about=20
this, please let me know.

Any comments appreciated.

//Peter



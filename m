Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6467FC78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 20:43:16 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 8CA105C0AFE;
	Mon, 25 Nov 2019 21:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574714597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=yp8c1YB5luZwVYwOLYb/Hmn+nI8Cc8ZBMD2/yNMHAGQ=;
	b=PY6rAh6EyqEH2nH7NXJJOHdgbClYV018Y6WPUALzIiiNasfpg67E6PQs10SXOAvAlmm9+O
	5GJ6KyRl79+NjGBE0EuoFvsFIAXH/+imyTFziNenNDHbWQEiqYiPkqxBGaEp6P3Pb0VKt/
	4U6BD3OexqaaouwAIj9umC7KROiln50=
MIME-Version: 1.0
Date: Mon, 25 Nov 2019 21:43:17 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Message-ID: <58bf106b6e2ed127b129b717ccab18fb@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: ming.liu@toradex.com, liu.ming50@gmail.com
Subject: Using timestamps (DATETIME) in PV
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
X-List-Received-Date: Mon, 25 Nov 2019 20:43:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

tl;dr: Afaict, using DATETIME in PV is currently impossible due to
commit 9ca2fad2 ("image: Expand PV to avoid AUTOREV parsing failures").
Do not use DATETIME in PV.


In an effort to use timestamps for development builds we tried to use
DATETIME in the PV variable of an image recipe (basically PV =
"${DATETIME}", although my real use case is a bit more involved, but
this is the part which matters). Unfortunately this lead to basehash
value changed errors:

ERROR: When reparsing
/build/ags/torizon-master/build-colibri-imx7/conf/../../layers/meta-toradex-torizon/recipes-images/images/torizon-core-docker.bb:do_patch,
the basehash value changed from
9d65be87aee58d81c6310c5d4a09e1ab94115074c2076766e5bb87267b6257ed to
3b069c8e23e86f778350cd91f17edd00ac71be5fb95a512b1fd567c31dcab46d. The
metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake torizon-core-docker -cdo_patch -Snone
ERROR: Then:
ERROR: $ bitbake torizon-core-docker -cdo_patch -Sprintdiff

Normally this can be fixed by excluding the variable from the
dependencies like this:

PV[vardepsexclude] += "DATETIME"

However, it did not help in this case. I then did what Richard suggests
in [1] and fired up bitbake-diffsigs using the two hashes from the error
showed. This revealed that it is still PV which is an issue:

NOTE: Starting bitbake server...
basehash changed from
4bf60537ad6dbcf8d54972bd81d51ea49d968600cebb6b198c25f4766ae2d31c to
4897cf911d1a75dcdd7f5cbead00d15fd8e419e9e647d49be4585640c67dd0a4
Variable PV value changed from '20191125160227' to '20191125160240'

I found three issues here.

1. sstate.bbclass sets PV[vardepvalue] = "${PV}" to explicitly evaluate
PV (see [2]). This can be easily fixed by clearing vardepvalue, e.g.
PV[vardepvalue] = "".

However, with this fixed we still see issue in custom image tasks.

2. image.bbclass uses localdata.setVar('PV', d.getVar('PV')) to
basically do the same (see [3]). Unfortunately I found no way to easily
alter this behavior from my layer. Since we make use of custom image
tasks we use IMAGE_CMD_x.

3. I also get "The postinstall intercept hook 'update_udev_hwdb' failed,
details in ...temp/log.do_rootfs", it says "chown: invalid user:
‘root:root’". It seems like a pseudo issue, however PSEUDO_LOCALSTATEDIR
seems to be setup correctly. It seems that PSEUDO_LOCALSTATEDIR has a
slight different timestamp then where the rootfs is located but I am not
sure if that is an issue. Anyways, this problem remains unsolved at this
point.

Maybe 2 could be solved differently such that the behavior can be
controlled from an image?

Especially since PV is part of the WORKDIR (which also seems to cause
the third issue) I am not sure how many more problems along those lines
waiting to be found. I plan to move to a different/custom variable to
accomplish my goal. However, since I did all the research so far I
wanted to post this anyway.

--
Stefan


[1]
https://git.openembedded.org/bitbake/commit/?id=857829048c14338132784326ba98a71f12192db8&h=master
[2]
https://git.openembedded.org/openembedded-core/commit/?id=918646ca803d56004fb0ab7c21e86cc9cb14513d&h=master
[3]
https://git.openembedded.org/openembedded-core/commit/?id=9ca2fad2e569597f460e6bcbbd96077c8b8cfce9&h=master


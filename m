Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SmMcK-00076l-02
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 12:15:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 10142315D839
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 12:04:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Cf68CKkjkKql
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 12:04:11 +0200 (CEST)
Received: from [172.22.22.61] (ip-88-153-5-144.unitymediagroup.de
	[88.153.5.144])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 31C94315D838
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 12:04:11 +0200 (CEST)
Message-ID: <4FF4151A.7050400@opendreambox.org>
Date: Wed, 04 Jul 2012 12:04:10 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1207032219210.21877@oneiric>
	<CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
In-Reply-To: <CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
Subject: Re: why would a recipe have both do_install() and do_install_append()?
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
X-List-Received-Date: Wed, 04 Jul 2012 10:15:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04.07.2012 08:32, Khem Raj wrote:
> On Tue, Jul 3, 2012 at 7:22 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>
>>   i'm probably just misreading something, but what is the point of a
>> recipe having both a do_install() and do_install_append() function?
>> for example, here's part of e2fsprogs_1.42.1.bb:
>>
>> do_install () {
>>         oe_runmake 'DESTDIR=${D}' install
>>         oe_runmake 'DESTDIR=${D}' install-libs
>>         # We use blkid from util-linux now so remove from here
>>         rm -f ${D}${base_libdir}/libblkid*
>>         rm -rf ${D}${includedir}/blkid
>>         rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
>> }
>>
>> do_install_append () {
>>         # e2initrd_helper and the pkgconfig files belong in libdir
>>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>>                 install -d ${D}${libdir}
>>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
>>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
>>         fi
>> }
>>
>>   how does that differ from simply defining a single do_install()
>> routine?  i'm willing for this to be a dumb question.
> 
> it does not. I think it could be arguably done in same do_install

Yes.

> but it does have some logical separation where the append operation is
> moving files from /lib to /usr/lib

It would be better to just use a comment and/or empty line for logical
separation.

> in theory another use of it is that you can override do_install_append
> in a .bbappend file
> and still reuse the do_install.

AFAICT, you can't override an append. Both appends, the original and the
bbappended, would get executed.

Regards,
Andreas



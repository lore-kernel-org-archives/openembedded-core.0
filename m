Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S89uo-0002na-UD
	for openembedded-core@openembedded.org; Thu, 15 Mar 2012 13:36:23 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8120FF8124D; Thu, 15 Mar 2012 06:27:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id AFC8AF8124C;
	Thu, 15 Mar 2012 06:27:36 -0600 (MDT)
Message-ID: <4F61E038.9020700@mlbassoc.com>
Date: Thu, 15 Mar 2012 06:27:36 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Interesting bitbake/fetcher error
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
X-List-Received-Date: Thu, 15 Mar 2012 12:36:23 -0000
X-Groupsio-MsgNum: 18881
Content-Type: multipart/mixed; boundary="------------010702020505090303010308"

--------------010702020505090303010308
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have two recipes for midori (attached).  When I try to build
the latest version, I get this error:
   ERROR: Fetcher failure for URL: 'http://archive.xfce.org/src/apps/midori/0.4/midori-0.4.4.tar.bz2;name=midori'. Checksum mismatch!
   File: '/local/my_test/downloads/midori-0.4.4.tar.bz2' has md5 checksum a6578ebfd237c0f22cce49113b95f70c when 900037557b82818d79d2dd1c5a7d7fd2 was expected
   File: '/local/my_test/downloads/midori-0.4.4.tar.bz2' has sha256 checksum fadd43f76c1c9f6a16483e60a804e58fb6817c6a595b1acdd59bcbdd7b35bca2 when 
fca4a0eab03358f20d7700069dbf2faaf8fa5c11aaad97f4208aea608f4bed9f was expected

It looks like having qualified checksums doesn't work quite right?  It's obviously
comparing the sums from the 0.4.3 recipe even though 0.4.4 is being executed.
   midori_0.4.3
     SRC_URI[midori.md5sum] = "900037557b82818d79d2dd1c5a7d7fd2"
     SRC_URI[midori.sha256sum] = "fca4a0eab03358f20d7700069dbf2faaf8fa5c11aaad97f4208aea608f4bed9f"

   Midori_0.4.4
     SRC_URI[midori.md5sum] = "a6578ebfd237c0f22cce49113b95f70c"
     SRC_URI[midori.sha256sum] = "fadd43f76c1c9f6a16483e60a804e58fb6817c6a595b1acdd59bcbdd7b35bca2"

Interestingly, if I comment out those lines in the 0.4.3 recipe,
but still leave it in my tree, the fetcher works.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------010702020505090303010308
Content-Type: text/plain;
 name="midori_0.4.3.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="midori_0.4.3.bb"

require midori.inc

PR = "r1"

SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           file://waf \
          "
#SRC_URI[midori.md5sum] = "900037557b82818d79d2dd1c5a7d7fd2"
#SRC_URI[midori.sha256sum] = "fca4a0eab03358f20d7700069dbf2faaf8fa5c11aaad97f4208aea608f4bed9f"

do_configure_prepend() {
  cp -f ${WORKDIR}/waf ${S}/
}

--------------010702020505090303010308
Content-Type: text/plain;
 name="midori_0.4.4.bb"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="midori_0.4.4.bb"

require midori.inc

PARALLEL_MAKE = ""

SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
          "
SRC_URI[midori.md5sum] = "a6578ebfd237c0f22cce49113b95f70c"
SRC_URI[midori.sha256sum] = "fadd43f76c1c9f6a16483e60a804e58fb6817c6a595b1acdd59bcbdd7b35bca2"

--------------010702020505090303010308--

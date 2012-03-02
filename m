Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1S3NiS-0001lO-T3
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 09:19:53 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Fri, 2 Mar 2012 16:11:05 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Fri, 2 Mar 2012
	16:10:55 +0800
Message-ID: <1330675739.1086.154.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Mar 2012 16:08:59 +0800
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Subject: [image_types_uboot] getdepends for ext2.gz.u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 02 Mar 2012 08:19:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

when using ext2.gz.u-boot as IMAGE_FSTYPES, I got error when doing
rootfs with error info:
genext2fs: command not found

after checked fuction imagetypes_getdepends, I guess the ext2's
dependency is not considered. maybe we should assign 'ext2' to
'basetype', but not 'type' directly.

Any idea?

def imagetypes_getdepends(d):
    ...
    for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
        ...
        basetype = type		# ??????????????????
        for ctype in ctypes:
            if type.endswith("." + ctype):
                basetype = type.rsplit(".", 1)[0]
                adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True),
deps)
                break
        adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , deps)

    depstr = ""
    for dep in deps:
        depstr += " " + dep + ":do_populate_sysroot"
    return depstr


-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com




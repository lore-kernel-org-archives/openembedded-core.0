Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 77D9660EFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 10:49:58 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so7537274wes.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 03:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:content-transfer-encoding
	:subject:message-id:date:to:mime-version;
	bh=2goF1SRbfKDvXFb93X8ZeYTw6Q1JZcLbFiMRLHLy/Sc=;
	b=a++iYltN5Ded0NBktjmnuY+lDXmqyzcaPVpWORB/U8uJoaEfaDZvl7EmuI+Z4IihwA
	U7/uOq8sVOpp9FGqyVTAOzVayxvcZ2Yu+sye8+L/hgysSlR4yrTzu1eV4N9DvbhnhWJZ
	yKckA+eLwSV8gvK4e4v+CbWP3IbNccRUxy3h7x1c03vjywV1RXHwP5Gfy+eMbZN54U9i
	kBHPsIbTN4i6s4kRCOmsMM7njzQvgvYPQOdpcXO2qxiSDT+DCIgWmNg6riEOQSaLf8y+
	vS3pLUULMzit6mThhP1Ywc5KlRJ6KuaoxXK2GBkiK76F//qHJr12QQ6RE0VPWrHFpDu1
	a4qw==
X-Gm-Message-State: ALoCoQmL10sIWXOYd5W+UnI6pcm4Bow1P3NRZcm9IKRcQIRyPWpKz6O76EYWCn91HLoztzQKPn8/
X-Received: by 10.180.205.212 with SMTP id li20mr28374560wic.2.1407149398893; 
	Mon, 04 Aug 2014 03:49:58 -0700 (PDT)
Received: from ?IPv6:2001:610:612::8185:a1a:1d8f:6e6f?
	([2001:610:612:0:8185:a1a:1d8f:6e6f])
	by mx.google.com with ESMTPSA id
	lk7sm42654130wjb.24.2014.08.04.03.49.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 03:49:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Message-Id: <08CDE0F5-F24D-4E80-AF2A-327B292D89FE@dominion.thruhere.net>
Date: Mon, 4 Aug 2014 12:49:55 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
X-Mailer: Apple Mail (2.1878.6)
Subject: perform_packagecopy can't handle bindir==base_bindir and errors out
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
X-List-Received-Date: Mon, 04 Aug 2014 10:50:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I'm currently trying to combine {base_}{lib,bin}dir and have set =
base_prefix to /usr and redefined some other vars:

+# Try to move distro stuff under /usr
+# Keep /etc and friend in /
+base_prefix =3D "/usr"
+nonarch_base_libdir =3D "/lib"
+sysconfdir =3D "/etc"
+servicedir =3D "/srv"
+sharedstatedir =3D "/com"
+localstatedir =3D "/var"

This hits a few problems (see tcpwrapper patch), but a bigger problem is =
with perform_packagecopy and kmod:

ERROR: Error executing a python function in =
/build/scratch/angstrom-v2014.12/sources/openembedded-core/meta/recipes-ke=
rnel/kmod/kmod_git.bb:

The stack trace of python calls that resulted in this exception/failure =
was:
File: 'perform_packagecopy', lineno: 89, function: <module>
     0085:                else:
     0086:                    bb.warn('%s: Unable to resolve dangling =
symlink: %s' % (pn, alt_target))
     0087:
     0088:
 *** 0089:perform_packagecopy(d)
     0090:
File: 'perform_packagecopy', lineno: 71, function: perform_packagecopy
     0067:        for alt_target in link_rename:
     0068:            src =3D '%s/%s' % (pkgdest, alt_target)
     0069:            dest =3D '%s/%s' % (pkgdest, =
link_rename[alt_target])
     0070:            link =3D os.readlink(src)
 *** 0071:            link_target =3D oe.path.realpath(src, pkgdest, =
True)
     0072:
     0073:            if os.path.lexists(link_target):
     0074:                # Ok, the link_target exists, we can rename
     0075:                bb.note('%s: Rename (link) %s -> %s' % (pn, =
alt_target, link_rename[alt_target]))
File: =
'/build/scratch/angstrom-v2014.12/sources/openembedded-core/meta/lib/oe/pa=
th.py', lineno: 229, function: realpath
     0225:        raise OSError(errno.EINVAL, "file '%s' is not below =
root" % file)
     0226:
     0227:    try:
     0228:        if use_physdir:
 *** 0229:            file =3D __realpath_rel(root, file[(len(root) - =
1):], root, loop_cnt, assume_dir)
     0230:        else:
     0231:            file =3D __realpath(file, root, loop_cnt, =
assume_dir)[0]
     0232:    except OSError as e:
     0233:        if e.errno =3D=3D errno.ELOOP:
File: =
'/build/scratch/angstrom-v2014.12/sources/openembedded-core/meta/lib/oe/pa=
th.py', lineno: 180, function: __realpath_rel
     0176:                # emit warning?
     0177:                pass
     0178:        else:
     0179:            (start, have_dir) =3D =
__realpath(os.path.join(start, d),
 *** 0180:                                           root, loop_cnt, =
assume_dir)
     0181:
     0182:        assert(__is_path_below(start, root))
     0183:
     0184:    return start
File: =
'/build/scratch/angstrom-v2014.12/sources/openembedded-core/meta/lib/oe/pa=
th.py', lineno: 200, function: __realpath
     0196:            assert(__is_path_below(tdir, root))
     0197:        else:
     0198:            tdir =3D root
     0199:
 *** 0200:        file =3D __realpath_rel(tdir, target, root, loop_cnt, =
assume_dir)
     0201:
     0202:    try:
     0203:        is_dir =3D os.path.isdir(file)
     0204:    except:
File: =
'/build/scratch/angstrom-v2014.12/sources/openembedded-core/meta/lib/oe/pa=
th.py', lineno: 169, function: __realpath_rel
     0165:    have_dir =3D True
     0166:
     0167:    for d in rel_path.split(os.path.sep):
     0168:        if not have_dir and not assume_dir:
 *** 0169:            raise OSError(errno.ENOENT, "no such directory %s" =
% start)
     0170:
     0171:        if d =3D=3D os.path.pardir: # '..'
     0172:            if len(start) >=3D len(root):
     0173:                # do not follow '..' before root
Exception: OSError: [Errno 2] no such directory =
/build/scratch/angstrom-v2014.12/build/tmp-angstrom_next-eglibc/work/armv5=
te-angstrom-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/package/usr/usr=


ERROR: Function failed: perform_packagecopy
ERROR: Logfile of failure stored in: =
/build/scratch/angstrom-v2014.12/build/tmp-angstrom_next-eglibc/work/armv5=
te-angstrom-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/temp/log.do_pac=
kage.2519
ERROR: Task 801 =
(/build/scratch/angstrom-v2014.12/sources/openembedded-core/meta/recipes-k=
ernel/kmod/kmod_git.bb, do_package) failed with exit code '1'

The contents of that dir:

koen@beast:/build/scratch/angstrom-v2014.12$ cd =
/build/scratch/angstrom-v2014.12/build/tmp-angstrom_next-eglibc/work/armv5=
te-angstrom-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/package/
=
koen@beast:/build/scratch/angstrom-v2014.12/build/tmp-angstrom_next-eglibc=
/work/armv5te-angstrom-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/pack=
age$ find .
.
./etc
./etc/depmod.d
./etc/modprobe.d
./usr
./usr/lib
./usr/lib/libkmod.so
./usr/lib/libkmod.so.2
./usr/lib/depmod.d
./usr/lib/depmod.d/search.conf
./usr/lib/modprobe.d
./usr/lib/libkmod.so.2.2.8
./usr/lib/pkgconfig
./usr/lib/pkgconfig/libkmod.pc
./usr/lib/libkmod.la
./usr/include
./usr/include/libkmod.h
./usr/bin
./usr/bin/kmod
./usr/bin/lsmod
./usr/sbin
./usr/sbin/modprobe
./usr/sbin/rmmod
./usr/sbin/modinfo
./usr/sbin/insmod
./usr/sbin/depmod
./usr/share
./usr/share/bash-completion
./usr/share/bash-completion/completions
./usr/share/bash-completion/completions/kmod
=
koen@beast:/build/scratch/angstrom-v2014.12/build/tmp-angstrom_next-eglibc=
/work/armv5te-angstrom-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/pack=
age$=20

I can't figure out why packagecopy wants to go into '/usr/usr', the kmod =
recipe itself seems fine.

regards,

Koen=


Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1QjPgA-0004Tc-19
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 07:50:42 +0200
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Wed, 20 Jul 2011 13:45:07 +0800
Received: from [192.168.0.101] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Wed, 20 Jul 2011
	13:45:05 +0800
From: NiQingliang <niqingliang@insigma.com.cn>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2011 13:56:04 +0800
X-Mailer: Evolution 3.0.2 
Message-ID: <1311141365.6973.7.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: [patch]for different default python version
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
X-List-Received-Date: Wed, 20 Jul 2011 05:50:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

most Linux distribution use python 2.x as the default as bitbake
expected, but some use python 3.x as the default (like archlinux), so
this patch come.

if the default python is 2.x, it will do nothing.
or it will search the python 2.x in /usr/bin and /bin.
if find it out, then make a soft link in the build dir, and add the
build dir into the env var PATH.

diff --git a/oe-init-build-env b/oe-init-build-env
index 77332a7..acf4e96 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -39,6 +39,34 @@ else
    $OEROOT/scripts/oe-setup-builddir
    unset OEROOT
    unset BBPATH
+
+   # find the python 2.x, if the default python is not.
+   # NOTE:
+   #    the 'python -V' need redirect to stdout
+   #    once we can ensure every distribution has 'python2' (currently,
except
+   #    ubuntu), we should change bitbake's shebang to '/usr/bin/env
python2',
+   #    and remove this patch.
+   # precondition:
+   #    $BUILDDIR is not NULL, but I doubt when it will be NULL.
+   #    user have not made the file $BUILDDIR/python by himself.
+   if [ -z "`/usr/bin/env python -V 2>&1|grep '^Python 2\.'`" ]; then
+      PYTHON2_BIN=3D""
+      for PY_BIN in `find /{usr/,}bin -regex '.*/python\(\|2\|2\.[0-9]*
\)'`; do
+         if [ -n "`$PY_BIN -V 2>&1|grep '^Python 2\.'`" ]; then
+            PYTHON2_BIN=3D$PY_BIN
+            break
+         fi
+      done
+      if [ -n "$PYTHON2_BIN" ]; then
+         ln -sf $PY_BIN $BUILDDIR/python
+         export PATH=3D"$BUILDDIR:$PATH"
+         echo "NOTE: poky will use '$PY_BIN' to execute python code."
+      else
+         echo "ERROR: unable to find Python 2.x, BitBake requires
Python 2.6 or 2.7."
+      fi
+      unset PYTHON2_BIN
+   fi
+
    [ -n "$BUILDDIR" ] && cd $BUILDDIR
 fi


--=20
=E5=80=AA=E5=BA=86=E4=BA=AE
TEL:    13588371863
E-MAIL: niqingliang@insigma.com.cn
BLOG:   http://niqingliang2003.wordpress.com





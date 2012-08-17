Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T2N29-0006cJ-Uu
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:56:18 +0200
Received: by ggmq1 with SMTP id q1so4348497ggm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 06:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=GHUBdRNZKFZGTW4aSsUP27cS296c26/27iz2PceA1Ok=;
	b=I2+9S+yST1XvGrRp9CbBO0xLT1qVAtOzfPG0fT8Uww7WRH2CH+NvUWd7VxVcmREgyp
	th0TI1JYusrDZv3tiVQ9i3WHdQFw+A3PgtV3k0vK92tLaWlhCvf2ypFT36F+A7cVu0CV
	MnE0nvQZDOZDp067x0gJHiK9H37HQhYXblNRsbhBCQZE4X5iwRN0A3Yb6vk2lyQBULsJ
	59RlmctHHMSUQn9Q0V/iZs8jBM3d5qOJJnMIZ0bMhi3B9OYzA0viiKosYkBqKhjeGesw
	SL4jnfZcVyeTW1W7TcVAmkoXjeiO5677GQYaGElaAxHTnb6iCl/ktiwbeo2KuuxPDGyn
	fbOg==
Received: by 10.50.41.195 with SMTP id h3mr2008259igl.34.1345211055671; Fri,
	17 Aug 2012 06:44:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Fri, 17 Aug 2012 06:43:55 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <502E4AB5.8030206@intel.com>
References: <cover.1345208249.git.andrei.gherzan@windriver.com>
	<fe8f0c9d64b8fb123545d8afcd7891c6d6d90728.1345208249.git.andrei.gherzan@windriver.com>
	<502E4AB5.8030206@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 17 Aug 2012 16:43:55 +0300
Message-ID: <CAK18fxHZF+wwQTS5NKpGunTCnrsx8Xx04LBeW+CPmrYqSbSsVg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmjZLkJJ5XRWXJAAFHbgOkpRqP5jQ5XTJwKIJZqsvp3u+sLNGWhnBn4fVGqEAmaZW1CO6Uu
Subject: Re: [PATCH 2/2] dbus-tests: Add separate recipe for building dbus-tests
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
X-List-Received-Date: Fri, 17 Aug 2012 13:56:18 -0000
Content-Type: multipart/alternative; boundary=14dae934051d1f07c104c7765b36

--14dae934051d1f07c104c7765b36
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 17, 2012 at 4:44 PM, Radu Moisan <radu.moisan@intel.com> wrote:

>
> On 08/17/2012 04:02 PM, Andrei Gherzan wrote:
>
> While compiling dbus with tests, dbus and dbus-glib are needed.
> To compile dbus-glib, dbus is needed (obviously). The only solution
> (to compile dbus with tests) is to create a new recipe where to
> compile dbus with --enable-tests --enable-embedded-tests, skip write
> to sysroot (noexec) and just package dbus-tests.
> A bash wrapper to run all tests is included.
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com> <andrei.gherzan@windriver.com>
> ---
>  meta/recipes-core/dbus/dbus-tests/run_test.sh |   22 +++++++++
>  meta/recipes-core/dbus/dbus-tests_1.4.20.bb   |   64 +++++++++++++++++++++++++
>  2 files changed, 86 insertions(+), 0 deletions(-)
>  create mode 100755 meta/recipes-core/dbus/dbus-tests/run_test.sh
>  create mode 100644 meta/recipes-core/dbus/dbus-tests_1.4.20.bb
>
> diff --git a/meta/recipes-core/dbus/dbus-tests/run_test.sh b/meta/recipes-core/dbus/dbus-tests/run_test.sh
> new file mode 100755
> index 0000000..90abad2
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-tests/run_test.sh
> @@ -0,0 +1,22 @@
> +#!/bin/sh
> +
> +# Tests location
> +export DBUS_TEST_HOMEDIR=/usr/lib/dbus-tests
> +# Tests data location
> +export DBUS_TEST_DATA=${DBUS_TEST_HOMEDIR}/test/data
> +
> +TESTS=" \
> +	bus/bus-test \
> +	bus/bus-test-system \
> +	dbus/dbus-test \
> +	bus/bus-test-launch-helper \
> +	test/shell-test \
> +	test/test-corrupt \
> +	test/test-dbus-daemon \
> +	test/test-loopback \
> +	test/test-marshal \
> +	test/test-relay \
> +	test/test-syslog \
> +	test/test-refs"
> +
> +${DBUS_TEST_HOMEDIR}/test/dbus-test-runner ${DBUS_TEST_HOMEDIR} ${TESTS}
> diff --git a/meta/recipes-core/dbus/dbus-tests_1.4.20.bb b/meta/recipes-core/dbus/dbus-tests_1.4.20.bb
> new file mode 100644
> index 0000000..0e7d272
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-tests_1.4.20.bb
> @@ -0,0 +1,64 @@
> +FILESEXTRAPATHS_append := "${THISDIR}/dbus-${PV}"
> +include recipes-core/dbus/dbus.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI[md5sum] = "79eca2f2c1894ac347acce128314428b"
> +SRC_URI[sha256sum] = "103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116ea62fcfd639520d5aaf"
> +
> +DEPENDS += "python-pygobject-native python-dbus-native dbus-glib dbus"
> +RDEPENDS_${PN} = "dbus-x11"
>
>  wouldn't RDEPENDS_${PN} = "dbus" be a better choice since dbus-x11 is
> RPROVIDED only for compatibility reasons?
>
>
Yes. Forgot about that. Thanks.
ag

--14dae934051d1f07c104c7765b36
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Aug 17, 2012 at 4:44 PM, Radu Moisan <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:radu.moisan@intel.com" target=3D"_blan=
k">radu.moisan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">


 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div><div class=3D"h5">
    <br>
    <div>On 08/17/2012 04:02 PM, Andrei Gherzan
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>While compiling dbus with tests, dbus and dbus-glib are needed.
To compile dbus-glib, dbus is needed (obviously). The only solution
(to compile dbus with tests) is to create a new recipe where to
compile dbus with --enable-tests --enable-embedded-tests, skip write
to sysroot (noexec) and just package dbus-tests.
A bash wrapper to run all tests is included.

Signed-off-by: Andrei Gherzan <a href=3D"mailto:andrei.gherzan@windriver.co=
m" target=3D"_blank">&lt;andrei.gherzan@windriver.com&gt;</a>
---
 meta/recipes-core/dbus/dbus-tests/run_test.sh |   22 +++++++++
 meta/recipes-core/dbus/<a href=3D"http://dbus-tests_1.4.20.bb" target=3D"_=
blank">dbus-tests_1.4.20.bb</a>   |   64 +++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-core/dbus/dbus-tests/run_test.sh
 create mode 100644 meta/recipes-core/dbus/<a href=3D"http://dbus-tests_1.4=
.20.bb" target=3D"_blank">dbus-tests_1.4.20.bb</a>

diff --git a/meta/recipes-core/dbus/dbus-tests/run_test.sh b/meta/recipes-c=
ore/dbus/dbus-tests/run_test.sh
new file mode 100755
index 0000000..90abad2
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-tests/run_test.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+# Tests location
+export DBUS_TEST_HOMEDIR=3D/usr/lib/dbus-tests
+# Tests data location
+export DBUS_TEST_DATA=3D${DBUS_TEST_HOMEDIR}/test/data
+
+TESTS=3D&quot; \
+	bus/bus-test \
+	bus/bus-test-system \
+	dbus/dbus-test \
+	bus/bus-test-launch-helper \
+	test/shell-test \
+	test/test-corrupt \
+	test/test-dbus-daemon \
+	test/test-loopback \
+	test/test-marshal \
+	test/test-relay \
+	test/test-syslog \
+	test/test-refs&quot;
+
+${DBUS_TEST_HOMEDIR}/test/dbus-test-runner ${DBUS_TEST_HOMEDIR} ${TESTS}
diff --git a/meta/recipes-core/dbus/<a href=3D"http://dbus-tests_1.4.20.bb"=
 target=3D"_blank">dbus-tests_1.4.20.bb</a> b/meta/recipes-core/dbus/<a hre=
f=3D"http://dbus-tests_1.4.20.bb" target=3D"_blank">dbus-tests_1.4.20.bb</a=
>
new file mode 100644
index 0000000..0e7d272
--- /dev/null
+++ b/meta/recipes-core/dbus/<a href=3D"http://dbus-tests_1.4.20.bb" target=
=3D"_blank">dbus-tests_1.4.20.bb</a>
@@ -0,0 +1,64 @@
+FILESEXTRAPATHS_append :=3D &quot;${THISDIR}/dbus-${PV}&quot;
+include recipes-core/dbus/dbus.inc
+
+PR =3D &quot;${INC_PR}.0&quot;
+
+SRC_URI[md5sum] =3D &quot;79eca2f2c1894ac347acce128314428b&quot;
+SRC_URI[sha256sum] =3D &quot;103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116=
ea62fcfd639520d5aaf&quot;
+
+DEPENDS +=3D &quot;python-pygobject-native python-dbus-native dbus-glib db=
us&quot;
+RDEPENDS_${PN} =3D &quot;dbus-x11&quot;</pre>
    </blockquote></div></div>
    wouldn&#39;t <small><font face=3D"Droid Sans Mono">RDEPENDS_${PN} =3D
        &quot;dbus&quot;</font></small> be a better choice since <small><fo=
nt face=3D"DejaVu Sans Mono">dbus-x11</font></small> is <small>RPROVIDED</s=
mall>
    only for compatibility reasons? <br><span class=3D"HOEnZb"><font color=
=3D"#888888">
    <br></font></span></div></blockquote><div>=A0</div><div>Yes. Forgot abo=
ut that. Thanks.</div><div>ag</div></div>

--14dae934051d1f07c104c7765b36--

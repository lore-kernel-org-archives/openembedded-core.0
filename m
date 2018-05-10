Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A789F75296
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 16:41:12 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id g1-v6so3753211iob.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/8yWeWjNHadt32zi66do6em3tc92rBTzJgV/TfosDHw=;
	b=NKwSsQ7urPZxYiNyaN7LSUPn7x086dxghXXyL+hsk3oBIW7AxrdkTwOCDYBme4OmE+
	Gz/aZWR6jyTqLD+6F9dS7RkkKLTrMIbFo2z3YVu/8enVcIkQkdGWi/vMXMYiOsFclOns
	SYcksgxq/WJWcZODK/oG52UC1vcQcwPPMOO7EmXq5mn700jDhy27pV18OajNs7acJjtd
	PhMBrw1vrF6NFKcLX0kGNcmkGaaQCXi9p35KfvjieGfzjX6S1TrWK5GgtcTjZ+/BEjA3
	AN9Pa3puj7jKA4qBBxA+u3NhotaJwcycLKQtLZOtGU6vBCMsMpcb65k1BI8YjkwHq3AK
	KWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/8yWeWjNHadt32zi66do6em3tc92rBTzJgV/TfosDHw=;
	b=ADQYujgP30KIslTELuFQ2ij/XfY6hUh3MLZj2zjvpChIQnt+ftCps7KWtDXxxOmOb5
	Y6mBYakpo9yK+dXvNzFANRCKthCsArX2lj5xB9iZHGuxfPsUNG4qPTHMshtUVenTOwje
	wdo09giBWancrhOXIQbbBkwjvUuOjCYwlfVzVeSPGSuXHf+GUIspDhtHJlojd4Pdg+mZ
	yrI1PYeHboSx5gL3nGGt4AVijk03VWWB/jT7+27XLgiorILac0qA8M5km7niarVjbvSU
	noKV+PjEZZ6wrel0ho0WOSxy+qvncbM0VokOMWl4Fw9hUkzyM2oMQg4YY0qDpvGOrlF8
	F4jA==
X-Gm-Message-State: ALKqPwc0WS8I07XsNA4jlG8AYk00f8+Ep3uDjUeAJCTme8xISIPZiHmB
	Wpw2X69NvMeVJUhQbV+vWqnqt84rYwDKcclqTjwNmQ==
X-Google-Smtp-Source: AB8JxZq8Zi7CXRRhYDz2PdnvvimjlSeVlsDYcIBJWZxIyXI5o8uekvjAFGWbh5S5g1HXa9zdOP65gRXwriVUfab/AvA=
X-Received: by 2002:a6b:6b16:: with SMTP id
	g22-v6mr2272998ioc.20.1525970473612; 
	Thu, 10 May 2018 09:41:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 10 May 2018 09:40:53 -0700 (PDT)
In-Reply-To: <20180510091021.61535-1-zhixiong.chi@windriver.com>
References: <20180510091021.61535-1-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 May 2018 17:40:53 +0100
Message-ID: <CAJTo0LZrGXj72oO+=qhKBhHx2xQZPQexMS1gMVLJmDqFeJ8sjA@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2] gettext: make gettext independant of host java components
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
X-List-Received-Date: Thu, 10 May 2018 16:41:14 -0000
Content-Type: text/plain; charset="UTF-8"

I'm *really* uncomfortable patching gnulib in gettext, as we'll be
carrying that patch for ever and no doubt having to copy/paste it for
every other upstream that uses gnulib.

Would it be possible to just pass JAVAC=/bin/false to configure instead?

Ross

On 10 May 2018 at 10:10, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
> The checksums of gettext were changing based on whether or not java
> and javac were installed. This patch makes gettext recipes independant
> of Java components.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  .../gettext-disable-javacomp-setting.patch         | 104 +++++++++++++++++++++
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb      |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/gettext-disable-javacomp-setting.patch
>
> diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/gettext-disable-javacomp-setting.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/gettext-disable-javacomp-setting.patch
> new file mode 100644
> index 0000000000..44ef3976f4
> --- /dev/null
> +++ b/meta/recipes-core/gettext/gettext-0.19.8.1/gettext-disable-javacomp-setting.patch
> @@ -0,0 +1,104 @@
> +The checksums of gettext were changing based on whether or not
> +java and javac were installed on the host.
> +Since '--disable-java' and '--disable-native-java' are included
> +in the EXTRA_OECONF, so it should not update and use the java env
> +information, even though the java and javac exist on the host.
> +This patch add reset operation for the env variable in m4 file to
> +avoid the issue.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +
> +Signed-ff-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +Index: gettext-0.19.8.1/gettext-runtime/configure.ac
> +===================================================================
> +--- gettext-0.19.8.1.orig/gettext-runtime/configure.ac
> ++++ gettext-0.19.8.1/gettext-runtime/configure.ac
> +@@ -35,7 +35,7 @@ AC_PROG_YACC
> +
> + gt_JAVA_CHOICE
> +
> +-gt_JAVACOMP([1.3], [1.1])
> ++gt_JAVACOMP([1.3], [1.1], [1])
> + AC_CHECK_PROG([JAR], [jar], [jar])
> + if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" != no; then
> +   BUILDJAVA=yes
> +Index: gettext-0.19.8.1/gettext-runtime/gnulib-m4/javacomp.m4
> +===================================================================
> +--- gettext-0.19.8.1.orig/gettext-runtime/gnulib-m4/javacomp.m4
> ++++ gettext-0.19.8.1/gettext-runtime/gnulib-m4/javacomp.m4
> +@@ -621,6 +621,17 @@ changequote([,])dnl
> +     fi
> +   fi
> +   rm -f conftest*.java conftest*.class
> ++  reset_env_variable=$3
> ++  if test -n "$reset_env_variable"; then
> ++    CONF_JAVAC=
> ++    HAVE_JAVAC_ENVVAR=
> ++    CLASSPATH=
> ++    CLASSPATH_SEPARATOR=:
> ++    HAVE_GCJ_C=
> ++    HAVE_JAVAC=
> ++    HAVE_JIKES=
> ++    HAVE_JAVACOMP=
> ++  fi
> +   if test -n "$HAVE_JAVACOMP"; then
> +     ac_result="$CONF_JAVAC"
> +   else
> +Index: gettext-0.19.8.1/gettext-tools/configure.ac
> +===================================================================
> +--- gettext-0.19.8.1.orig/gettext-tools/configure.ac
> ++++ gettext-0.19.8.1/gettext-tools/configure.ac
> +@@ -44,7 +44,7 @@ fi
> + AC_SUBST([BUILDJAVAEXE])
> +
> + gt_JAVAEXEC
> +-gt_JAVACOMP([1.3])
> ++gt_JAVACOMP([1.3], [], [1])
> + AC_CHECK_PROG([JAR], [jar], [jar])
> + if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" != no; then
> +   BUILDJAVA=yes
> +Index: gettext-0.19.8.1/gettext-tools/gnulib-m4/javacomp.m4
> +===================================================================
> +--- gettext-0.19.8.1.orig/gettext-tools/gnulib-m4/javacomp.m4
> ++++ gettext-0.19.8.1/gettext-tools/gnulib-m4/javacomp.m4
> +@@ -621,6 +621,17 @@ changequote([,])dnl
> +     fi
> +   fi
> +   rm -f conftest*.java conftest*.class
> ++  reset_env_variable=$3
> ++  if test -n "$reset_env_variable"; then
> ++    CONF_JAVAC=
> ++    HAVE_JAVAC_ENVVAR=
> ++    CLASSPATH=
> ++    CLASSPATH_SEPARATOR=:
> ++    HAVE_GCJ_C=
> ++    HAVE_JAVAC=
> ++    HAVE_JIKES=
> ++    HAVE_JAVACOMP=
> ++  fi
> +   if test -n "$HAVE_JAVACOMP"; then
> +     ac_result="$CONF_JAVAC"
> +   else
> +Index: gettext-0.19.8.1/gettext-tools/gnulib-m4/javaexec.m4
> +===================================================================
> +--- gettext-0.19.8.1.orig/gettext-tools/gnulib-m4/javaexec.m4
> ++++ gettext-0.19.8.1/gettext-tools/gnulib-m4/javaexec.m4
> +@@ -87,6 +87,17 @@ AC_DEFUN([gt_JAVAEXEC],
> +       CLASSPATH="$save_CLASSPATH"
> +     ])
> +   fi
> ++  if test -z "$4"; then
> ++    HAVE_JAVAEXEC=
> ++    CONF_JAVA=
> ++    CLASSPATH=
> ++    CLASSPATH_SEPARATOR=
> ++    HAVE_JAVA_ENVVAR=
> ++    HAVE_GIJ=
> ++    HAVE_JAVA=
> ++    HAVE_JRE=
> ++    HAVE_JVIEW=
> ++  fi
> +   if test -n "$HAVE_JAVAEXEC"; then
> +     ac_result="$CONF_JAVA"
> +   else
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> index 68f5cc329a..490e291f8f 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>            file://add-with-bisonlocaledir.patch \
>            file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
>            file://use-pkgconfig.patch \
> +          file://gettext-disable-javacomp-setting.patch \
>  "
>
>  SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


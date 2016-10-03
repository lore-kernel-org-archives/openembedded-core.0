Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id DC8C4719AE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 14:16:37 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id b75so24423335lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sa1b9Y8GU3OA8TqVTl39s+Hv0JcLbnSts7VrFnNPxWA=;
	b=oyFhS6dUn2a6wCdKttwP7zWRaqAewNz1YqpU2vbfcoGp2MoH06jq90rTYY7gJ5Sh5m
	t1rCZHtmjS9++6IqXf5fHy4JcZmmpT3lIpr6LlYICV5wUBRNW4uXkmYqh3h3n5d2Yb3d
	dbALL5sisVpuDIHSrBDtx2L2b3Brqk15BoXjocUy5mjd5lyufsSqJ3miItfmqKzYdhlE
	7g0S5XGEV0xFJ/Xd794GOyJnNSmw3DtscxBmI4JmqN+NBDPDKBBnJllPknizFm9x/ZJO
	WfGxjp/PLhRSK4YzYDF7AOPgVPGJYDUDJl9SEK5RJYELbFNnvP3k4MB+WLgIKVHm5SZ+
	AL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sa1b9Y8GU3OA8TqVTl39s+Hv0JcLbnSts7VrFnNPxWA=;
	b=JuLI+wp1qQExrXLCa9wyM4g9exYkoNf7vxXdohRU9MlJOA3W2l6F6vsCYackMIK/+2
	RNnYbzeEOrvbAAXJ7buEexbjIO2TOKRIv+F7wdawP9z0uFLQEGEmt3Zk7rn++r4sFn86
	bN5X7PkZvZ10uclgGqrvfM6qjiLdcWyAfEkGaG3Sp6AmYZU4MRh7dfPUKvWFwN1w7E3f
	dI6OGEVjv777XT1Da7Vn0QD8qhcwAF/VA9p31G1ucgWmmS7B6M2OBB8NYwhP4+7ZsweW
	vBhLuR/mibdZxVQjCOI34X4ls2yngkUwOwSxFAj9eBPChjbyP8oh2LRWrvLfnDpO6Wmz
	2ywA==
X-Gm-Message-State: AA6/9Rn1IECzRuekl5Wk4i3wgZaI3Mc7iJ7yD+w/3Dh9wpgWVsvjsvMb3fy2UwxLxhpAgNWt
X-Received: by 10.194.154.227 with SMTP id vr3mr6380891wjb.127.1475504198109; 
	Mon, 03 Oct 2016 07:16:38 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yt4sm34606312wjc.48.2016.10.03.07.16.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Oct 2016 07:16:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 15:16:32 +0100
Message-Id: <1475504192-17738-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
References: <1475504192-17738-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] binutils: apply RPATH fixes from our libtool patches
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
X-List-Received-Date: Mon, 03 Oct 2016 14:16:38 -0000

We don't autoreconf/libtoolize binutils as it has very strict requirements, so
extend our patching of the stock libtool to include two fixes to RPATH
behaviour, as part of the solution to ensure that native binaries don't have
RPATHs pointing at the host system's /usr/lib.

This generally doesn't cause a problem but it can cause some binaries (such as
ar) to abort on startup:

./x86_64-pokysdk-linux-ar: relocation error: /usr/lib/libc.so.6: symbol
_dl_starting_up, version GLIBC_PRIVATE not defined in file ld-linux.so.2 with
link time reference

The situation here is that ar is built and as it links to the host libc/loader
has an RPATH for /usr/lib.  If tmp is wiped and then binutils is installed from
sstate relocation occurs and the loader changed to the sysroot, but there
remains a RPATH for /usr/lib.  This means that the sysroot loader is used with
the host libc, which can be incompatible.  By telling libtool that the host
library paths are in the default search path, and ensuring that all default
search paths are not added as RPATHs by libtool, the result is a binary that
links to what it should be linking to and nothing else.

[ YOCTO #9287 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
 .../binutils/0014-libtool-remove-rpath.patch       | 100 +++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
index 9cc57fc..03b7bed 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
@@ -33,6 +33,7 @@ SRC_URI = "\
      file://0011-Change-default-emulation-for-mips64-linux.patch \
      file://0012-Add-support-for-Netlogic-XLP.patch \
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
+     file://0014-libtool-remove-rpath.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch b/meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch
new file mode 100644
index 0000000..d56948f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch
@@ -0,0 +1,100 @@
+Apply these patches from our libtool patches as not only are redundant RPATHs a
+waste of space but they can cause incorrect linking when native packages are
+restored from sstate.
+
+fix-rpath.patch:
+We don't want to add RPATHS which match default linker
+search paths, they're a waste of space. This patch
+filters libtools list and removes the ones we don't need.
+
+norm-rpath.patch:
+Libtool may be passed link paths of the form "/usr/lib/../lib", which
+fool its detection code into thinking it should be included as an
+RPATH in the generated binary.  Normalize before comparision.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 683317c..860a16a 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -8053,8 +8053,14 @@ EOF
+ 		  esac
+ 		fi
+ 	      else
+-		eval flag=\"$hardcode_libdir_flag_spec\"
+-		func_append dep_rpath " $flag"
++                # We only want to hardcode in an rpath if it isn't in the
++                # default dlsearch path.
++	        case " $sys_lib_dlsearch_path " in
++	        *" $libdir "*) ;;
++	        *) eval flag=\"$hardcode_libdir_flag_spec\"
++                   func_append dep_rpath " $flag"
++                   ;;
++	        esac
+ 	      fi
+ 	    elif test -n "$runpath_var"; then
+ 	      case "$perm_rpath " in
+@@ -8790,8 +8796,14 @@ EOF
+ 	      esac
+ 	    fi
+ 	  else
+-	    eval flag=\"$hardcode_libdir_flag_spec\"
+-	    func_append rpath " $flag"
++            # We only want to hardcode in an rpath if it isn't in the
++            # default dlsearch path.
++	    case " $sys_lib_dlsearch_path " in
++	    *" $libdir "*) ;;
++	    *) eval flag=\"$hardcode_libdir_flag_spec\"
++               rpath+=" $flag"
++               ;;
++	    esac
+ 	  fi
+ 	elif test -n "$runpath_var"; then
+ 	  case "$perm_rpath " in
+@@ -8841,8 +8853,14 @@ EOF
+ 	      esac
+ 	    fi
+ 	  else
+-	    eval flag=\"$hardcode_libdir_flag_spec\"
+-	    func_append rpath " $flag"
++            # We only want to hardcode in an rpath if it isn't in the
++            # default dlsearch path.
++	    case " $sys_lib_dlsearch_path " in
++	    *" $libdir "*) ;;
++	    *) eval flag=\"$hardcode_libdir_flag_spec\"
++               func_append rpath " $flag"
++               ;;
++	    esac
+ 	  fi
+ 	elif test -n "$runpath_var"; then
+ 	  case "$finalize_perm_rpath " in
+diff --git a/ltmain.sh b/ltmain.sh
+index 683317c..860a16a 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -8055,8 +8055,10 @@ EOF
+ 	      else
+                 # We only want to hardcode in an rpath if it isn't in the
+                 # default dlsearch path.
++                func_normal_abspath "$libdir"
++                libdir_norm=$func_normal_abspath_result
+ 	        case " $sys_lib_dlsearch_path " in
+-	        *" $libdir "*) ;;
++	        *" $libdir_norm "*) ;;
+ 	        *) eval flag=\"$hardcode_libdir_flag_spec\"
+                    func_append dep_rpath " $flag"
+                    ;;
+@@ -8798,8 +8800,10 @@ EOF
+ 	  else
+             # We only want to hardcode in an rpath if it isn't in the
+             # default dlsearch path.
++            func_normal_abspath "$libdir"
++            libdir_norm=$func_normal_abspath_result
+ 	    case " $sys_lib_dlsearch_path " in
+-	    *" $libdir "*) ;;
++	    *" $libdir_norm "*) ;;
+ 	    *) eval flag=\"$hardcode_libdir_flag_spec\"
+                rpath+=" $flag"
+                ;;
-- 
2.8.1



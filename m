Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.2936.1606905276117234451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 02:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=iQrgh9Bh;
 spf=pass (domain: blade-group.com, ip: 209.85.221.47, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f47.google.com with SMTP id z7so3174869wrn.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Dec 2020 02:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9uho6FFplotvnwj1tH7H1DNXt2QTQBrpwnQ8SMAFu4=;
        b=iQrgh9Bh+b4wImCwz3DN8bAhIHeh95eAUOM1GxhQbuhNl68oRFPkVJKrBE6A3gaFBF
         kHHqrOJS2fnkT6PnZYu+BPY6G+5DMlotPO6iDelXoe9Nu6sa+6nzUcd6YzUzlTfojuY/
         8SLoqMrP18WpJZMeCt9YMwUQ7XEqn1Hy7favbenlnB+GL2fnQrST70S4K/dSw842w89V
         K0RIadp6yeKOwEJfzBbpE3GpJI1EFvjN2J8ozsvfGwJgHoVPgbXyqB/qJMAOR/Zh2/6b
         QQMHYBr5OYw45f70DlKKy0S2X3gKoRB+Tyzyr//do7am2ytgitAiXOIJ0JBXZg6rfc+/
         T2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9uho6FFplotvnwj1tH7H1DNXt2QTQBrpwnQ8SMAFu4=;
        b=QQLzCylNsDxxRhRGy9c4hGLbXyHrPvgIHplY53LkwzFqAbzs9kMJvCZtNIvqcXsLRS
         dbVzZzWLByFXdohYQKmOgnMaRtdeKHVzP+S+IMuVNbHc5WoQz92VY7TGFpWMu1z32ICF
         exxLLGcITk8H+z7SIHRRhyxes0dV+ehBVk/gA9a9NIKLxAlEiJzhBmbxAt+T1Tk7mYPw
         TwqrGSJA94sY6b6rahGKQTYbZTVXe5t1hHhKdyJOOMlm5Y+hg7X9WN+FJp2latQEuHgA
         N/XWuMhJE5jABliJn/DVYuaGUM8TTWz7eYh+unMH/YDNa/f916Zas5RqEMED+TtfbmlP
         EQDw==
X-Gm-Message-State: AOAM532Q/ulv8EkYdLpO4mMFGmdIZb9I2+oPPmAYqbBcVgEXZOCTvrrM
	JCLGkJP+eXo65DJRsWOU2Vi+kpU9PJp9Bg==
X-Google-Smtp-Source: ABdhPJwcq2k+BDiV69EohaU/HH/4dx0foTbEv56iSVihtc8ZUgShUWpnf5Kylje2nCb8tIDFUdZ+5Q==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr2498223wrm.259.1606905273927;
        Wed, 02 Dec 2020 02:34:33 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.blade-group.net ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q25sm1631217wmq.37.2020.12.02.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 02:34:32 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [RFC][PATCH] Add support for downloading yarn-based dependencies via normal fetchers
Date: Wed,  2 Dec 2020 11:34:00 +0100
Message-Id: <20201202103400.1440717-1-yann@blade-group.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This works like:
- yarn-v1-mkbbinc script generates a $PACKAGE.inc bitbake snippet containing
  * SRC_URI additions for all dependencies
  * YARNLOCK_CHECKSUM for consistency checking
- $PACKAGE.bb uses "require $PACKAGE.inc"

Supports only:
- *.tgz from npm registries and arbitrary sources
- *.tar.gz from arbitrary sources including github releases
---
 meta-os/classes/yarn-v1.bbclass |  15 +++
 scripts/yarn-v1-mkbbinc         | 168 ++++++++++++++++++++++++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 meta-os/classes/yarn-v1.bbclass
 create mode 100755 scripts/yarn-v1-mkbbinc


There are quite some ad-hoc things in the mkbbinc script, that make we
wonder whether it's got enough quality for inclusion.  OTOH it could
be seen as a base that's already working for the subset it's meant to
address, and it seems quite overkill to create a layer just for these
2 files.

Could be more clear in python than in bash, though, I guess.

diff --git a/meta-os/classes/yarn-v1.bbclass b/meta-os/classes/yarn-v1.bbclass
new file mode 100644
index 0000000000..296b4116b0
--- /dev/null
+++ b/meta-os/classes/yarn-v1.bbclass
@@ -0,0 +1,15 @@
+# yarn-v1 unpack support from offline mirror
+
+do_unpack_yarn_depends() {
+    # make sure we did not forget to update the .inc with new package version
+    CKSUM=$(sha256sum ${S}/yarn.lock |cut -d' ' -f 1)
+    [ "$CKSUM" = "${YARNLOCK_CHECKSUM}" ] || bbfatal "recipe does not match ${S}/yarn.lock, please rerun yarn-v1-mkbbinc"
+
+    # go use offline mirror
+    echo 'yarn-offline-mirror "${WORKDIR}/offline-mirror"' > ${S}/.yarnrc
+    yarn --verbose --frozen-lockfile --offline --cwd ${S}
+}
+
+do_unpack_yarn_depends[depends] += "yarn-native:do_populate_sysroot"
+
+addtask do_unpack_yarn_depends after do_unpack before do_patch
diff --git a/scripts/yarn-v1-mkbbinc b/scripts/yarn-v1-mkbbinc
new file mode 100755
index 0000000000..a2a7a2d918
--- /dev/null
+++ b/scripts/yarn-v1-mkbbinc
@@ -0,0 +1,168 @@
+#!/bin/bash
+set -eE
+
+# Usage: yarn-v1-mkbbinc upstream/yarn.lock meta-foo/recipes-bar/package.inc
+#
+# Takes the list of dependencies recorded in a yarn.lock file and
+# generates a bitbake include file suitable for a simple "require
+# package.inc".  It appends all those dependencies to SRC_URI so
+# do_unpack will put them in ${WORKDIR}/offline-mirror/, and pulls
+# yarn-v1.bbclass to provide a do_unpack_yarn_depends sitting between
+# do_unpack and do_patch.
+
+# Known issues:
+
+# - this script makes assumptions about the yarn.lock syntax, for
+#   which the sole parser is part of yarn itself.  A js implementation
+#   could make use of that parser instead of doing ad-hoc text
+#   processing (though that works well enough).
+
+# - this script makes assumptions about the layout of the yarn v1
+#   "offline mirror".  A js implementation could possibly, maybe, use
+#   yarn's internal APIs to get the correct name.
+
+# - it has to include seemingly ad-hoc rules for different registry
+#   implementations.  Maybe this too could go away with a js
+#   implementation.
+
+# - yarn v2 uses an "offline cache" instead of this "offline mirror",
+#   will need a similar processing.
+
+die() {
+    echo >&2 "ERROR: $*"
+    exit 1
+}
+
+
+## command-line
+
+[ $# = 2 ] ||
+    die "usage: $(basename $0) upstream/yarn.lock meta-foo/recipes-bar/package.inc"
+
+YARNLOCK="$1"
+BBINC="$2"
+
+
+## core funcs
+
+# derive cache filename for a standard npm registry
+# (essentially wet-finger guesses)
+npm_cachefilename() {
+    urldir="$1"
+    remotefilename="$2"
+
+    case "$urldir" in
+        https://gitlab.com/api/v4/projects/*/packages/npm/*)
+            dir=${urldir#https://gitlab.com/api/v4/projects/*/packages/npm/}
+            ;;
+        *) # holds for registry.yarnpkg.com and registry.npmjs.org
+            dir=${urldir#*://} # strip protocol
+            dir=${dir#*/} # strip server
+            ;;
+    esac
+
+    shortpkg=$(basename $dir)
+    case "$dir" in
+        */$shortpkg) ;;
+        $shortpkg) ;;
+        *) die "wrong assumption dir='$dir' shortpkg='$shortpkg' urldir='$urldir' remotefilename='$remotefilename'" ;;
+    esac
+
+    pkg=$(echo $remotefilename | sed s/$shortpkg-.*/$shortpkg/) # strip version+suffix
+    case "$dir" in
+        */$pkg) ;;
+        $pkg) ;;
+        *) die "wrong assumption dir='$dir' shortpkg='$shortpkg' pkg='$pkg' urldir='$urldir' remotefilename='$remotefilename'" ;;
+    esac
+
+    # mangle filename according to depth in registry
+    dir=${dir%$pkg}
+    remotefilename=$(echo $remotefilename | tr / -)
+    case "$dir" in
+        '') echo "$remotefilename" ;;
+        */*/) die "more than one level of dirs '$dir' above package name in $url" ;;
+        */) echo "${dir%/}-$remotefilename" ;;
+    esac
+    #die "DBG dir='$dir' pkg='$pkg' urldir='$urldir' remotefilename='$remotefilename'"
+}
+
+gen_dependencies() {
+    grep '^ *resolved ".*#.*"$' "$YARNLOCK" |
+        cut -d'"' -f 2 | {
+        print_srcuri "SRC_URI_append = \" \\"
+        CKSUMS=""
+        while IFS=# read url checksum ; do
+            case "$url" in
+                *.tgz)
+                    afterdash=${url#*/-/}
+                    if [ "$afterdash" = "$url" ]; then
+                        # no /-/ in URL
+                        cachefilename=$(basename $url)
+                    else
+                        beforedash=${url%/-/*}
+                        cachefilename="$(npm_cachefilename "$beforedash" "$afterdash")"
+                    fi
+
+                    # Protect from invalid characters in SRC_URI's "name" value.
+                    # I see no guaranty that it can't lead to a name clash, but
+                    # do_fetch will bomb out if that happens.
+                    srcid=$(echo $cachefilename | tr @ .)
+
+                    print_srcuri " $url;downloadfilename=$cachefilename;name=$srcid;unpack=0;subdir=offline-mirror \\"
+                    ;;
+
+                *.tar.gz)
+                    cachefilename=$(basename $url)
+                    srcid=$(echo $cachefilename | tr @ .)
+                    print_srcuri " $url;downloadfilename=$cachefilename;name=$srcid;unpack=0;subdir=offline-mirror \\"
+                    ;;
+
+                *) die "unsupported URL '$url'" ;;
+            esac
+            print_cksums "SRC_URI[$srcid.sha1sum] = \"$checksum\""
+        done
+        print_srcuri "\""
+    }
+}
+
+
+## main processing
+
+TMPSRCURI=$(mktemp --tmpdir yarn-mkbb.XXXXXX.inc)
+TMPCKSUMS=$(mktemp --tmpdir yarn-mkbb.XXXXXX.inc)
+
+print_srcuri() {
+    echo >> "$TMPSRCURI" "$@"
+}
+print_cksums() {
+    echo >> "$TMPCKSUMS" "$@"
+}
+
+CKSUM=$(sha256sum  "$YARNLOCK" |cut -d' ' -f 1)
+
+gen_dependencies
+
+[ "$CKSUM" = $(sha256sum  "$YARNLOCK" |cut -d' ' -f 1) ] ||
+    die "$YARNLOCK changed under my feet"
+
+TMPINC=$(mktemp --tmpdir yarn-mkbb.XXXXXX.inc)
+
+cat > "$TMPINC" <<EOF
+# This file was generated by $(basename $0)
+
+inherit yarn-v1
+
+YARNLOCK_CHECKSUM = "$CKSUM"
+
+EOF
+
+cat "$TMPSRCURI" >> "$TMPINC"
+echo >> "$TMPINC"
+cat "$TMPCKSUMS" >> "$TMPINC"
+
+rm "$TMPSRCURI" "$TMPCKSUMS"
+
+
+## rename to final output name
+
+mv -i "$TMPINC" "$BBINC"
-- 
2.29.2


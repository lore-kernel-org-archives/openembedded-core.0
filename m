Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.1746.1599498151497365067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pRAlgZWm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id u13so8294927pgh.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2iNBujT0gTgf5eZhw7brpiI3DYc2V3K0lYiszrKJNKA=;
        b=pRAlgZWmvEw1uuJ1c0Eliooi9lTTBlS1KD6QJUuZE+ut3fReeUyvwCx+zvagPgkSDb
         LSE4stej1DnMGDzIvsLCNl3VeKfxk3MxPSNkyOIfLZgDEBZxR6N/bei3RHV7CgESIyfs
         e3VSiFKRAjJIj+2N/OldEM0ECe34qb/71TH+fvUNQga8GWle66AeOLNhf0jFysGkZnmH
         xGuaCrpxLI74F6BQ9ov6Gj5amKdsYOAjb9JeczkTSgTsihgH05yxaGCy3aKIGhxMjJ5X
         h372JUoNOALpmVRFWqa7QXHEYW6DzNI9erqyK9/P9CDy8Rrh/My6MeeeltUXuhzQ7sPI
         dL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2iNBujT0gTgf5eZhw7brpiI3DYc2V3K0lYiszrKJNKA=;
        b=FjeX57znlyG5BO8ZiP4A74kYtcpjQL4s+q4wNY88YrUclgEONOewVCk4EeO6mxVFWy
         wxNNlJzQpMWjY7cRY/rTTt8ks4pfINVvu5INLpKaf4oot8fMTaK5meaAERFW3BC6bdEz
         y8X8LYEkMOhsG5p3K68TSfy/Mtf827pwbvIn88w3YuAerQQi20BU8DG6C1BGvInmP9oi
         rfAJa48mTjRDrTQN1IKm6t0UJZFEPzYpiUXwhpaSIGi9yw6uT1zOhkMPITlaV3iID+9N
         JIJd3ILGC2QZOb2NeANrhT0OjfDKq8FLx4fW5c6lHphqHHI3ZQogCvZUP2OoieqbLmbG
         4jIA==
X-Gm-Message-State: AOAM530GrlGJY/S92zfwSDci+37bm+xWq5CQyckRhC6Zj8ddS0wGpNO/
	d88WXDUPR3CiYC76DpZylZF+M34Q3Ak2n9jo
X-Google-Smtp-Source: ABdhPJybJya+HbrZc7pjI2/87kQn7deRsdPMuPCdEyUkdrHFkHH1vYivncw+jyZ/X/S8GhbGP/9jGA==
X-Received: by 2002:a62:1984:: with SMTP id 126mr20560681pfz.17.1599498150441;
        Mon, 07 Sep 2020 10:02:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/18] package.bbclass: explode the RPROVIDES so we don't think the versions are provides
Date: Mon,  7 Sep 2020 07:02:00 -1000
Message-Id: <be88ca5c4bd0dd98d172a53727c7104d46349fdd.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

emit_pkgdata() creates symlinks for each of the RPROVIDES in
pkgdata/MACHINE/runtime-rprovides.  However this string can contain
versions which results in directories called (=2.32), so pass the
RPROVIDES string through bb.utils.explode_deps() to strip the versions
out.

Helps mitigate - but not solve - #13999.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a5395dec34192db233bfb2a060e5ccc99708f03)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2d96e646da..23ff4772fa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1544,7 +1544,7 @@ fi
         # Symlinks needed for rprovides lookup
         rprov = d.getVar('RPROVIDES_%s' % pkg) or d.getVar('RPROVIDES')
         if rprov:
-            for p in rprov.strip().split():
+            for p in bb.utils.explode_deps(rprov):
                 subdata_sym = pkgdatadir + "/runtime-rprovides/%s/%s" % (p, pkg)
                 bb.utils.mkdirhier(os.path.dirname(subdata_sym))
                 oe.path.symlink("../../runtime/%s" % pkg, subdata_sym, True)
-- 
2.17.1


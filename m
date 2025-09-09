Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB644CAC58F
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 19:30:20 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4213.1757446212995613653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 12:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qB2hZNAC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24af8cd99ddso76696775ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 12:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1757446212; x=1758051012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP6XDgLeIVyJiZwY2Ru/WsDw0DiSZjquJ/igjnRtLXY=;
        b=qB2hZNACY1+/mA+N/qW4kZtnTu3ydFjEZPSH49B9xfQ19Ns2BVdbwwyDSfW+c/UafC
         EkS+FA6WRtBh2MpRJHbtb85uHTtEm+utcdA/jGlfWpYYli3HMKdXB9lQ0BbYcr1EBJaR
         g2cbjN5zZrqCQb/Xh4DxJnz4vZ5UoM/HpqcOpInXWcIADzhu4XUUecjGtZn6rZS8isv7
         rwunQShRal1WibSRiZMtJnvt27Cfjk7d37a+Q/ISyRCZf+C00ztqxE2QsC12xsTEDthk
         MD39h/eKwUlxEwTEUjYd969ma3TZaqtcvCY0DoDJN55fRIHi6Sclqjuwyk/C4nVMOY9E
         6kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757446212; x=1758051012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gP6XDgLeIVyJiZwY2Ru/WsDw0DiSZjquJ/igjnRtLXY=;
        b=GzjOH6QYdIv0D6JyzRkzDONimAJ2o2hndFzYjNYOC9x8adn/1NffwTR87OVuOEK2pV
         1FyzicBPeYq2wDWZM28VafuM/tsHB/cip40yoECenUCHMhLSiyQ2wxYBTSCr9d795b5s
         Ds/zltEn1Qgh5IQHFUBZs9PwrCCZ5NpDZcbawwgzUps02xYIVC7Cdx4rVnWQzyis4FU0
         IJuSQfn6JHdbJ2x+yBgBo07af6D/GNjGGt4JDy4lnYkODP4CVizrNNBAo1PpgA+t7AQm
         0mrt4Xo/a/WnVshBW2OipQsgFT8WSzRBxsckMD2WIkfcX23GDkKYfUyXsjIF05HQPMxI
         q5AA==
X-Gm-Message-State: AOJu0YxRH3zr/FIb8LhVBxGdBnmhmXdJkOcOeb8I/AtIugwatkKi1YEJ
	4iX0uCDa3n4qoHWWtV2u1olB+EjHu3gdwzWheWC3qPStFw5eRbR2zr7ALliYqwpyczAQKO3IvfB
	koPia
X-Gm-Gg: ASbGncuyOkbFYtdYbF0pHeIJ8yg6avsIm78F3Zv66WWlaHL3yfPYDejYAI9qUCSFMfd
	uFCPnSPDGJMygR9dMSmdOTgour9Ft9U6qWdiaNczpHQf7sbJ1Uf58Ot33WzX2bEuGcWkpmKf2lq
	ccw3C9FYLT/vLuYqhR6QWGQU2Km6ozCIzicKtoTMW+k1aAhpvYfU3n0or+U0kxXxkEZ9J1mfSFG
	2GSaSGnicQhWU+0bjynNUYz1Ub4Rp0o7MFlHnE3Dl9N51ftmHUHGCnJwHn/ORGDiGuT2nnPy1Ea
	CwXrCWDK3I6opD6DEDMZFKfNniswxraGK0XFdb8CedwjHGd279fCc49jgNhYhhzrIVEALEsJsZS
	V5gnGf1I+GttB0w==
X-Google-Smtp-Source: AGHT+IFtqctGVigWHBV8HsqXYyRl3wRLoLohMT4NHp+yKwKd4dsardV94wFEgHaEai7we4QPDfdwMw==
X-Received: by 2002:a17:903:f8b:b0:251:5900:97fe with SMTP id d9443c01a7336-25172e32f26mr162292475ad.43.1757446211879;
        Tue, 09 Sep 2025 12:30:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c560:31a3:4ee8:6083])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2b0e5965sm5093855ad.143.2025.09.09.12.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:30:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] ffmpeg: fix multiple CVEs
Date: Tue,  9 Sep 2025 12:30:00 -0700
Message-ID: <aa68992ddc5744bb4fdbb3a3cd0636b303449be2.1757446071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757446071.git.steve@sakoman.com>
References: <cover.1757446071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 19:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223134

From: Archana Polampalli <archana.polampalli@windriver.com>

CVE-2023-6605:
A flaw was found in FFmpeg's DASH playlist support. This vulnerability allows arbitrary HTTP GET
requests to be made on behalf of the machine running FFmpeg via a crafted DASH playlist containing malicious URLs.

CVE-2023-6604:
A flaw was found in FFmpeg. This vulnerability allows unexpected additional CPU load
and storage consumption, potentially leading to degraded performance or denial of service
via the demuxing of arbitrary data as XBIN-formatted data without proper format validation.

CVE-2023-6602:
flaw was found in FFmpeg's TTY Demuxer. This vulnerability allows possible data exfiltration
via improper parsing of non-TTY-compliant input files in HLS playlists.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...602-CVE-2023-6604-CVE-2023-6605-0001.patch |  79 ++++++++++
 ...602-CVE-2023-6604-CVE-2023-6605-0002.patch | 142 ++++++++++++++++++
 ...602-CVE-2023-6604-CVE-2023-6605-0003.patch |  45 ++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   3 +
 4 files changed, 269 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch
new file mode 100644
index 0000000000..2b28eeada5
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch
@@ -0,0 +1,79 @@
+From 3ef588940eef62742d28171bf212a474206f8e03 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 15 May 2023 00:54:50 +0200
+Subject: [PATCH] avformat: add ff_match_url_ext()
+
+Match url against a list of extensions similar to av_match_ext()
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit a7b06bfc5d20b12ff0122702c09517cf359fbb66)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-6604 CVE-2023-6602 CVE-2023-6605
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/3ef588940ee]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/format.c   | 25 +++++++++++++++++++++++++
+ libavformat/internal.h |  9 +++++++++
+ 2 files changed, 34 insertions(+)
+
+diff --git a/libavformat/format.c b/libavformat/format.c
+index 52b85c1..5e057d7 100644
+--- a/libavformat/format.c
++++ b/libavformat/format.c
+@@ -48,6 +48,31 @@ int av_match_ext(const char *filename, const char *extensions)
+     return 0;
+ }
+
++int ff_match_url_ext(const char *url, const char *extensions)
++{
++    const char *ext;
++    URLComponents uc;
++    int ret;
++    char scratchpad[128];
++
++    if (!url)
++        return 0;
++
++    ret = ff_url_decompose(&uc, url, NULL);
++    if (ret < 0 || !URL_COMPONENT_HAVE(uc, scheme))
++        return ret;
++    for (ext = uc.query; *ext != '.' && ext > uc.path; ext--)
++        ;
++
++    if (*ext != '.')
++        return 0;
++    if (uc.query - ext > sizeof(scratchpad))
++        return AVERROR(ENOMEM); //not enough memory in our scratchpad
++    av_strlcpy(scratchpad, ext + 1, FFMIN(sizeof(scratchpad), uc.query - ext));
++
++    return av_match_name(scratchpad, extensions);
++}
++
+ const AVOutputFormat *av_guess_format(const char *short_name, const char *filename,
+                                       const char *mime_type)
+ {
+diff --git a/libavformat/internal.h b/libavformat/internal.h
+index bffb8e6..584b979 100644
+--- a/libavformat/internal.h
++++ b/libavformat/internal.h
+@@ -1015,6 +1015,15 @@ int ff_unlock_avformat(void);
+  */
+ void ff_format_set_url(AVFormatContext *s, char *url);
+
++/**
++ * Return a positive value if the given url has one of the given
++ * extensions, negative AVERROR on error, 0 otherwise.
++ *
++ * @param url        url to check against the given extensions
++ * @param extensions a comma-separated list of filename extensions
++ */
++int ff_match_url_ext(const char *url, const char *extensions);
++
+ void avpriv_register_devices(const AVOutputFormat * const o[], const AVInputFormat * const i[]);
+
+ /**
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
new file mode 100644
index 0000000000..1ba1006197
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
@@ -0,0 +1,142 @@
+From 9803800e0e8cd8e1e7695f77cfbf4e0db0abfe57 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 16 Jan 2025 01:28:46 +0100
+Subject: [PATCH] avformat/hls: Be more picky on extensions
+
+This blocks disallowed extensions from probing
+It also requires all available segments to have matching extensions to the format
+mpegts is treated independent of the extension
+
+It is recommended to set the whitelists correctly
+instead of depending on extensions, but this should help a bit,
+and this is easier to backport
+
+Fixes: CVE-2023-6602 II. HLS Force TTY Demuxer
+Fixes: CVE-2023-6602 IV. HLS XBIN Demuxer DoS Amplification
+
+The other parts of CVE-2023-6602 have been fixed by prior commits
+
+Found-by: Harvey Phillips of Amazon Element55 (element55)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 91d96dc8ddaebe0b6cb393f672085e6bfaf15a31)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-6602 CVE-2023-6604 CVE-2023-6605
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9803800e0e8cd8e1e7695f77cfbf4e0db0abfe57]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ doc/demuxers.texi |  7 +++++++
+ libavformat/hls.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 57 insertions(+)
+
+diff --git a/doc/demuxers.texi b/doc/demuxers.texi
+index 26ae768..6e0b25e 100644
+--- a/doc/demuxers.texi
++++ b/doc/demuxers.texi
+@@ -365,6 +365,13 @@ segment index to start live streams at (negative values are from the end).
+ @item allowed_extensions
+ ',' separated list of file extensions that hls is allowed to access.
+
++@item extension_picky
++This blocks disallowed extensions from probing
++It also requires all available segments to have matching extensions to the format
++except mpegts, which is always allowed.
++It is recommended to set the whitelists correctly instead of depending on extensions
++Enabled by default.
++
+ @item max_reload
+ Maximum number of times a insufficient list is attempted to be reloaded.
+ Default value is 1000.
+diff --git a/libavformat/hls.c b/libavformat/hls.c
+index d5e9b21..e1bb677 100644
+--- a/libavformat/hls.c
++++ b/libavformat/hls.c
+@@ -214,6 +214,7 @@ typedef struct HLSContext {
+     AVDictionary *avio_opts;
+     AVDictionary *seg_format_opts;
+     char *allowed_extensions;
++    int extension_picky;
+     int max_reload;
+     int http_persistent;
+     int http_multiple;
+@@ -716,6 +717,40 @@ static int open_url(AVFormatContext *s, AVIOContext **pb, const char *url,
+     return ret;
+ }
+
++static int test_segment(AVFormatContext *s, const AVInputFormat *in_fmt, struct playlist *pls, struct segment *seg)
++{
++    HLSContext *c = s->priv_data;
++    int matchA = 3;
++    int matchF = 0;
++
++    if (!c->extension_picky)
++        return 0;
++
++    if (strcmp(c->allowed_extensions, "ALL"))
++        matchA =      av_match_ext    (seg->url, c->allowed_extensions)
++                 + 2*(ff_match_url_ext(seg->url, c->allowed_extensions) > 0);
++
++    if (!matchA) {
++        av_log(s, AV_LOG_ERROR, "URL %s is not in allowed_extensions\n", seg->url);
++        return AVERROR_INVALIDDATA;
++    }
++
++    if (in_fmt) {
++        if (in_fmt->extensions) {
++            matchF =      av_match_ext(    seg->url, in_fmt->extensions)
++                     + 2*(ff_match_url_ext(seg->url, in_fmt->extensions) > 0);
++        } else if (!strcmp(in_fmt->name, "mpegts"))
++            matchF = 3;
++
++        if (!(matchA & matchF)) {
++            av_log(s, AV_LOG_ERROR, "detected format extension %s mismatches allowed extensions in url %s\n", in_fmt->extensions ? in_fmt->extensions : "none", seg->url);
++            return AVERROR_INVALIDDATA;
++        }
++    }
++
++    return 0;
++}
++
+ static int parse_playlist(HLSContext *c, const char *url,
+                           struct playlist *pls, AVIOContext *in)
+ {
+@@ -959,6 +994,14 @@ static int parse_playlist(HLSContext *c, const char *url,
+                     goto fail;
+                 }
+
++                ret = test_segment(c->ctx, pls->ctx ? pls->ctx->iformat : NULL, pls, seg);
++                if (ret < 0) {
++                    av_free(seg->url);
++                    av_free(seg->key);
++                    av_free(seg);
++                    goto fail;
++                }
++
+                 if (duration < 0.001 * AV_TIME_BASE) {
+                     av_log(c->ctx, AV_LOG_WARNING, "Cannot get correct #EXTINF value of segment %s,"
+                                     " set to default value to 1ms.\n", seg->url);
+@@ -2040,6 +2083,11 @@ static int hls_read_header(AVFormatContext *s)
+             pls->ctx->interrupt_callback = s->interrupt_callback;
+             url = av_strdup(pls->segments[0]->url);
+             ret = av_probe_input_buffer(&pls->pb.pub, &in_fmt, url, NULL, 0, 0);
++
++            for (int n = 0; n < pls->n_segments; n++)
++                if (ret >= 0)
++                    ret = test_segment(s, in_fmt, pls, pls->segments[n]);
++
+             if (ret < 0) {
+                 /* Free the ctx - it isn't initialized properly at this point,
+                 * so avformat_close_input shouldn't be called. If
+@@ -2467,6 +2515,8 @@ static const AVOption hls_options[] = {
+         OFFSET(allowed_extensions), AV_OPT_TYPE_STRING,
+         {.str = "3gp,aac,avi,ac3,eac3,flac,mkv,m3u8,m4a,m4s,m4v,mpg,mov,mp2,mp3,mp4,mpeg,mpegts,ogg,ogv,oga,ts,vob,wav"},
+         INT_MIN, INT_MAX, FLAGS},
++    {"extension_picky", "Be picky with all extensions matching",
++        OFFSET(extension_picky), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, FLAGS},
+     {"max_reload", "Maximum number of times a insufficient list is attempted to be reloaded",
+         OFFSET(max_reload), AV_OPT_TYPE_INT, {.i64 = 1000}, 0, INT_MAX, FLAGS},
+     {"m3u8_hold_counters", "The maximum number of times to load m3u8 when it refreshes without new segments",
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch
new file mode 100644
index 0000000000..0a2488814f
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch
@@ -0,0 +1,45 @@
+From 800f5f818e858c864db86c174114d13f44d59044 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Thu, 16 Jan 2025 00:22:05 +0100
+Subject: [PATCH] avformat/dashdec: Check whitelist
+
+Fixes: CVE-2023-6602, V. DASH Playlist SSRF
+
+Found-by: Harvey Phillips of Amazon Element55 (element55)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+(cherry picked from commit 4c96d6bf75357ab13808efc9f08c1b41b1bf5bdf)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2023-6602 CVE-2023-6604 CVE-2023-6604
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/097131a6474bd6294ff337fa92025df60dff907a]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/dashdec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/dashdec.c b/libavformat/dashdec.c
+index 797fe74..78118de 100644
+--- a/libavformat/dashdec.c
++++ b/libavformat/dashdec.c
+@@ -442,7 +442,7 @@ static int open_url(AVFormatContext *s, AVIOContext **pb, const char *url,
+     av_freep(pb);
+     av_dict_copy(&tmp, *opts, 0);
+     av_dict_copy(&tmp, opts2, 0);
+-    ret = avio_open2(pb, url, AVIO_FLAG_READ, c->interrupt_callback, &tmp);
++    ret = ffio_open_whitelist(pb, url, AVIO_FLAG_READ, c->interrupt_callback, &tmp, s->protocol_whitelist, s->protocol_blacklist);
+     if (ret >= 0) {
+         // update cookies on http response with setcookies.
+         char *new_cookies = NULL;
+@@ -1217,7 +1217,7 @@ static int parse_manifest(AVFormatContext *s, const char *url, AVIOContext *in)
+         close_in = 1;
+
+         av_dict_copy(&opts, c->avio_opts, 0);
+-        ret = avio_open2(&in, url, AVIO_FLAG_READ, c->interrupt_callback, &opts);
++        ret = ffio_open_whitelist(&in, url, AVIO_FLAG_READ, c->interrupt_callback, &opts, s->protocol_whitelist, s->protocol_blacklist);
+         av_dict_free(&opts);
+         if (ret < 0)
+             return ret;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index f205c4a5db..27a9a80e8c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -49,6 +49,9 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2025-22919.patch \
            file://CVE-2025-22921.patch \
            file://CVE-2025-7700.patch \
+           file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0001.patch \
+           file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch \
+           file://CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0003.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.43.0



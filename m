Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EE8C07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 14:06:08 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.29024.1664201161389662216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 07:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Wtx1VB6Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id m3so9137553eda.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 07:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=oOldYAJ8czFsWo1ecEesj+vBdDGq3Qtz7uCd+2hgS8M=;
        b=Wtx1VB6Z/Do9JrbJKCUDInatxIl6372RZ0ay6HIA4tcFhPEZGywQPmvq8mUcPi1Hvi
         gXQHBDRtPImGjv5/4uaTjWR9YTNlD0UCMrcm9QtGEmd1Us4PezpiB4AV+4w/TcYi3Doy
         0JvN3gUQeKdSwF5Dnk83IT76l8icM4D9xsKlORtaZbaHAtKTiHWGQjIEuaYiGETFkJjP
         xqlTOMAnq795mddim5QNxnjGYUr+vbNPGJ+amg6MMPuNYjuNna/1vfYo2V6u3+1sAcIF
         XyOZuyFXHkUcne0G07E/8zEoonb4fnvTLk38LzCvSzb3Q2iiNotP44g6HOXfzwmLxix5
         kwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oOldYAJ8czFsWo1ecEesj+vBdDGq3Qtz7uCd+2hgS8M=;
        b=4O5E3U3xS9+jzJAdaCcHB9wS9EediuixMJa70B1RwAnRdTJsHkbfElRnPIyUcwnEfU
         of0DqSOcUuQpQJ6dxwIULM8jnRVRKrRWuYrrMLWwMuEQ8mEI7F82XwYBFf0PgycSF6ZV
         rzmVeSwGqJvMTXDdWq58mZsBoqZuij5hHkrZzKzackiwEcINWGdO4MhTVcPgu8x503RU
         iWnx6/1RzScJbsA747hPjtPdmKvUwrYpxGOSU8D1uNj9WGJDHV9ozqaNL05/74HEywa6
         XHkBjG6ID1F8tlxFVV+/hGHl/Tg7kVGX8YRUrXvM1mPJ6Kmjr7OfxGNP9SwkcL4+wlLF
         EP7g==
X-Gm-Message-State: ACrzQf28QaWjgZZPIKMhkJhMfUHcopw/ApwrDVVFcuI5GAXVSc2QppC7
	leTcbYaKb3ElDa6hDPG61pMf48gQfRunH+4kjabJNQ==
X-Google-Smtp-Source: 
 AMsMyM4JB1UOoYKlV72rB5psQiljbueSwgxHgQwB3Fo5/d0FZULfhUc2P9WLeV/YvPeHHZnqG2U/7kaYW1ibgCYOMEc=
X-Received: by 2002:aa7:df8b:0:b0:44e:882f:7c5c with SMTP id
 b11-20020aa7df8b000000b0044e882f7c5cmr22565205edy.418.1664201159349; Mon, 26
 Sep 2022 07:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220926022915.60581-1-xiangyu.chen@windriver.com>
In-Reply-To: <20220926022915.60581-1-xiangyu.chen@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 26 Sep 2022 04:05:47 -1000
Message-ID: 
 <CAOSpxdZ4XEDzKq-2AbBB=nXaoPpH_USg2c8T-OjCQQV8MCWEZQ@mail.gmail.com>
Subject: Re: [OE-Core][kirkstone][PATCH] babeltrace: Handle negative time and
 offset from Epoch
To: Xiangyu Chen <xiangyu.chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 14:06:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171066

On Sun, Sep 25, 2022 at 4:29 PM Xiangyu Chen <xiangyu.chen@windriver.com> w=
rote:
>
> Backport patch from upstream to handle negative time and offset from Epoc=
h[1]
> and fix the yocto autobuilder ptest failures for both qemux86-64 and qemu=
arm64 when
> applied this backport patch[2].

Since master babeltrace is also at version 1.5.8 this patch should be
taken for master first, and I will then cherry-pick to kirkstone.

Steve

> [1] 0001-Handle-negative-time-and-offset-from-Epoch.patch backport from
> https://git.efficios.com/?p=3Dbabeltrace.git;a=3Dcommit;h=3D61cf588beae75=
2e5ddfc60b6b5310f769ac9e852
>
> [2] 0002-babeltrace-fix-bug-in-stream-intersection-option.patch
> The failures reported at https://lists.openembedded.org/g/openembedded-co=
re/topic/89657972#163126
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...-negative-time-and-offset-from-Epoch.patch | 857 ++++++++++++++++++
>  ...ix-bug-in-stream-intersection-option.patch | 114 +++
>  meta/recipes-kernel/lttng/babeltrace_1.5.8.bb |   2 +
>  3 files changed, 973 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Handle-nega=
tive-time-and-offset-from-Epoch.patch
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace/0002-babeltrace-=
fix-bug-in-stream-intersection-option.patch
>
> diff --git a/meta/recipes-kernel/lttng/babeltrace/0001-Handle-negative-ti=
me-and-offset-from-Epoch.patch b/meta/recipes-kernel/lttng/babeltrace/0001-=
Handle-negative-time-and-offset-from-Epoch.patch
> new file mode 100644
> index 0000000000..c7409bcfbb
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace/0001-Handle-negative-time-and-=
offset-from-Epoch.patch
> @@ -0,0 +1,857 @@
> +From a8305ca6fc9b32b22bedbc96a8f71b14243e9965 Mon Sep 17 00:00:00 2001
> +From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Date: Wed, 22 Apr 2020 03:00:02 +0000
> +Subject: [PATCH 1/2] Handle negative time and offset from Epoch
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Handle cases where a trace have a negative offset from Epoch.
> +If Epoch is arbitrary (e.g. embedded system starting at 0, without any
> +network access), the "0" can be used as correlation point between
> +various components, and some components could start before the
> +correlation point. Therefore, especially in traces where the time is
> +meant to be shown in nanoseconds or cycles from the correlation point,
> +it also makes sense to have a negative time value.
> +
> +It introduces API-breaking changes in the C and Python APIs, since we
> +need to be able to return negative time values, which were previously
> +used as errors (-1ULL).
> +
> +The --offset and --offset-ns command line parameters can now take
> +negative offset (seconds and nanoseconds) values too.
> +
> +The [sec.ns] format is used as fallback so we don't attempt to pass
> +a negative time value to POSIX time-formatting APIs.
> +
> +This also fixes an inaccurate return value in an error path of
> +bt_ctf_event_populate_event_header().
> +
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
> +
> +Upstream-Status: Backport [https://git.efficios.com/?p=3Dbabeltrace.git;=
a=3Dcommit;h=3D61cf588beae752e5ddfc60b6b5310f769ac9e852]
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + converter/babeltrace.c                        |   4 +-
> + formats/ctf-text/ctf-text.c                   |   2 +-
> + formats/ctf/ctf.c                             | 115 +++++++++++++-----
> + formats/ctf/events-private.h                  |  10 +-
> + formats/ctf/events.c                          |  11 +-
> + .../metadata/ctf-visitor-generate-io-struct.c |   1 -
> + include/babeltrace/babeltrace-internal.h      |   8 +-
> + include/babeltrace/clock-internal.h           |   2 +-
> + include/babeltrace/ctf-ir/clock-internal.h    |   2 +-
> + include/babeltrace/ctf/events.h               |   8 +-
> + include/babeltrace/ctf/types.h                |   6 +-
> + include/babeltrace/format.h                   |  10 +-
> + include/babeltrace/trace-handle-internal.h    |   8 +-
> + include/babeltrace/trace-handle.h             |  25 ++--
> + lib/context.c                                 |  44 +++++--
> + lib/trace-handle.c                            |  39 +++---
> + tests/lib/test_ctf_writer.c                   |   6 +-
> + tests/lib/test_seek.c                         |  28 ++---
> + 18 files changed, 209 insertions(+), 120 deletions(-)
> +
> +diff --git a/converter/babeltrace.c b/converter/babeltrace.c
> +index ef783ed4..2ac16179 100644
> +--- a/converter/babeltrace.c
> ++++ b/converter/babeltrace.c
> +@@ -375,7 +375,7 @@ static int parse_options(int argc, char **argv)
> +                               goto end;
> +                       }
> +                       errno =3D 0;
> +-                      opt_clock_offset =3D strtoull(str, &endptr, 0);
> ++                      opt_clock_offset =3D strtoll(str, &endptr, 0);
> +                       if (*endptr !=3D '\0' || str =3D=3D endptr || err=
no !=3D 0) {
> +                               fprintf(stderr, "[error] Incorrect --cloc=
k-offset argument: %s\n", str);
> +                               ret =3D -EINVAL;
> +@@ -400,7 +400,7 @@ static int parse_options(int argc, char **argv)
> +                               goto end;
> +                       }
> +                       errno =3D 0;
> +-                      opt_clock_offset_ns =3D strtoull(str, &endptr, 0)=
;
> ++                      opt_clock_offset_ns =3D strtoll(str, &endptr, 0);
> +                       if (*endptr !=3D '\0' || str =3D=3D endptr || err=
no !=3D 0) {
> +                               fprintf(stderr, "[error] Incorrect --cloc=
k-offset-ns argument: %s\n", str);
> +                               ret =3D -EINVAL;
> +diff --git a/formats/ctf-text/ctf-text.c b/formats/ctf-text/ctf-text.c
> +index 16f156de..e001a548 100644
> +--- a/formats/ctf-text/ctf-text.c
> ++++ b/formats/ctf-text/ctf-text.c
> +@@ -43,7 +43,7 @@
> + #include <unistd.h>
> + #include <stdlib.h>
> +
> +-#define NSEC_PER_SEC 1000000000ULL
> ++#define NSEC_PER_SEC 1000000000LL
> +
> + int opt_all_field_names,
> +       opt_scope_field_names,
> +diff --git a/formats/ctf/ctf.c b/formats/ctf/ctf.c
> +index 1ba9017f..3c774188 100644
> +--- a/formats/ctf/ctf.c
> ++++ b/formats/ctf/ctf.c
> +@@ -70,7 +70,7 @@
> +  */
> + #define WRITE_PACKET_LEN      (getpagesize() * 8 * CHAR_BIT)
> +
> +-#define NSEC_PER_SEC 1000000000ULL
> ++#define NSEC_PER_SEC 1000000000LL
> +
> + #define INDEX_PATH "./index/%s.idx"
> +
> +@@ -79,8 +79,8 @@ int opt_clock_cycles,
> +       opt_clock_date,
> +       opt_clock_gmt;
> +
> +-uint64_t opt_clock_offset;
> +-uint64_t opt_clock_offset_ns;
> ++int64_t opt_clock_offset;
> ++int64_t opt_clock_offset_ns;
> +
> + extern int yydebug;
> + char *opt_debug_info_dir;
> +@@ -114,11 +114,13 @@ void ctf_set_handle(struct bt_trace_descriptor *de=
scriptor,
> + static
> + int ctf_close_trace(struct bt_trace_descriptor *descriptor);
> + static
> +-uint64_t ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
> +-              struct bt_trace_handle *handle, enum bt_clock_type type);
> ++int ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
> ++              struct bt_trace_handle *handle, enum bt_clock_type type,
> ++              int64_t *timestamp);
> + static
> +-uint64_t ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
> +-              struct bt_trace_handle *handle, enum bt_clock_type type);
> ++int ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
> ++              struct bt_trace_handle *handle, enum bt_clock_type type,
> ++              int64_t *timestamp);
> + static
> + int ctf_convert_index_timestamp(struct bt_trace_descriptor *tdp);
> +
> +@@ -167,17 +169,20 @@ void bt_ctf_hook(void)
> + }
> +
> + static
> +-uint64_t ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
> +-              struct bt_trace_handle *handle, enum bt_clock_type type)
> ++int ctf_timestamp_begin(struct bt_trace_descriptor *descriptor,
> ++              struct bt_trace_handle *handle, enum bt_clock_type type,
> ++              int64_t *timestamp)
> + {
> +       struct ctf_trace *tin;
> +-      uint64_t begin =3D ULLONG_MAX;
> +-      int i, j;
> ++      int64_t begin =3D LLONG_MAX;
> ++      int i, j, ret;
> +
> +       tin =3D container_of(descriptor, struct ctf_trace, parent);
> +
> +-      if (!tin)
> ++      if (!tin || !timestamp) {
> ++              ret =3D -EINVAL;
> +               goto error;
> ++        }
> +
> +       /* for each stream_class */
> +       for (i =3D 0; i < tin->streams->len; i++) {
> +@@ -198,8 +203,10 @@ uint64_t ctf_timestamp_begin(struct bt_trace_descri=
ptor *descriptor,
> +                                       parent);
> +                       stream_pos =3D &cfs->pos;
> +
> +-                      if (!stream_pos->packet_index)
> ++                      if (!stream_pos->packet_index) {
> ++                              ret =3D -EINVAL;
> +                               goto error;
> ++                      }
> +
> +                       if (stream_pos->packet_index->len <=3D 0)
> +                               continue;
> +@@ -214,29 +221,38 @@ uint64_t ctf_timestamp_begin(struct bt_trace_descr=
iptor *descriptor,
> +                               if (index->ts_cycles.timestamp_begin < be=
gin)
> +                                       begin =3D index->ts_cycles.timest=
amp_begin;
> +                       } else {
> ++                              ret =3D -EINVAL;
> +                               goto error;
> +                       }
> +               }
> +       }
> +
> +-      return begin;
> ++        if (begin =3D=3D LLONG_MAX) {
> ++                ret =3D -ENOENT;
> ++                goto error;
> ++        }
> ++        *timestamp =3D begin;
> ++        return 0;
> +
> + error:
> +-      return -1ULL;
> ++      return ret;
> + }
> +
> + static
> +-uint64_t ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
> +-              struct bt_trace_handle *handle, enum bt_clock_type type)
> ++int ctf_timestamp_end(struct bt_trace_descriptor *descriptor,
> ++              struct bt_trace_handle *handle, enum bt_clock_type type,
> ++              int64_t *timestamp)
> + {
> +       struct ctf_trace *tin;
> +-      uint64_t end =3D 0;
> +-      int i, j;
> ++      int64_t end =3D LLONG_MIN;
> ++      int i, j, ret;
> +
> +       tin =3D container_of(descriptor, struct ctf_trace, parent);
> +
> +-      if (!tin)
> ++        if (!tin || !timestamp) {
> ++                ret =3D -EINVAL;
> +               goto error;
> ++      }
> +
> +       /* for each stream_class */
> +       for (i =3D 0; i < tin->streams->len; i++) {
> +@@ -257,8 +273,10 @@ uint64_t ctf_timestamp_end(struct bt_trace_descript=
or *descriptor,
> +                                       parent);
> +                       stream_pos =3D &cfs->pos;
> +
> +-                      if (!stream_pos->packet_index)
> ++                      if (!stream_pos->packet_index) {
> ++                              ret =3D -EINVAL;
> +                               goto error;
> ++                      }
> +
> +                       if (stream_pos->packet_index->len <=3D 0)
> +                               continue;
> +@@ -273,15 +291,21 @@ uint64_t ctf_timestamp_end(struct bt_trace_descrip=
tor *descriptor,
> +                               if (index->ts_cycles.timestamp_end > end)
> +                                       end =3D index->ts_cycles.timestam=
p_end;
> +                       } else {
> ++                              ret =3D -EINVAL;
> +                               goto error;
> +                       }
> +               }
> +       }
> +
> +-      return end;
> ++        if (end =3D=3D LLONG_MIN) {
> ++                ret =3D -ENOENT;
> ++                goto error;
> ++        }
> ++        *timestamp =3D end;
> ++        return 0;
> +
> + error:
> +-      return -1ULL;
> ++      return ret;
> + }
> +
> + /*
> +@@ -328,7 +352,9 @@ void ctf_print_timestamp_real(FILE *fp,
> +                       struct ctf_stream_definition *stream,
> +                       uint64_t timestamp)
> + {
> +-      uint64_t ts_sec =3D 0, ts_nsec;
> ++        int64_t ts_sec =3D 0, ts_nsec;
> ++        uint64_t ts_sec_abs, ts_nsec_abs;
> ++        bool is_negative;
> +
> +       ts_nsec =3D timestamp;
> +
> +@@ -341,9 +367,40 @@ void ctf_print_timestamp_real(FILE *fp,
> +       ts_sec +=3D ts_nsec / NSEC_PER_SEC;
> +       ts_nsec =3D ts_nsec % NSEC_PER_SEC;
> +
> ++        if (ts_sec >=3D 0 && ts_nsec >=3D 0) {
> ++                is_negative =3D false;
> ++                ts_sec_abs =3D ts_sec;
> ++                ts_nsec_abs =3D ts_nsec;
> ++        } else if (ts_sec > 0 && ts_nsec < 0) {
> ++                is_negative =3D false;
> ++                ts_sec_abs =3D ts_sec - 1;
> ++                ts_nsec_abs =3D NSEC_PER_SEC + ts_nsec;
> ++        } else if (ts_sec =3D=3D 0 && ts_nsec < 0) {
> ++                is_negative =3D true;
> ++                ts_sec_abs =3D ts_sec;
> ++                ts_nsec_abs =3D -ts_nsec;
> ++        } else if (ts_sec < 0 && ts_nsec > 0) {
> ++                is_negative =3D true;
> ++                ts_sec_abs =3D -(ts_sec + 1);
> ++                ts_nsec_abs =3D NSEC_PER_SEC - ts_nsec;
> ++        } else if (ts_sec < 0 && ts_nsec =3D=3D 0) {
> ++                is_negative =3D true;
> ++                ts_sec_abs =3D -ts_sec;
> ++                ts_nsec_abs =3D ts_nsec;
> ++        } else {        /* (ts_sec < 0 && ts_nsec < 0) */
> ++                is_negative =3D true;
> ++                ts_sec_abs =3D -ts_sec;
> ++                ts_nsec_abs =3D -ts_nsec;
> ++        }
> ++
> +       if (!opt_clock_seconds) {
> +               struct tm tm;
> +-              time_t time_s =3D (time_t) ts_sec;
> ++              time_t time_s =3D (time_t) ts_sec_abs;
> ++
> ++                if (is_negative) {
> ++                        fprintf(stderr, "[warning] Fallback to [sec.ns]=
 for printing negative time value. Use --clock-seconds.\n");
> ++                        goto seconds;
> ++                }
> +
> +               if (!opt_clock_gmt) {
> +                       struct tm *res;
> +@@ -377,12 +434,12 @@ void ctf_print_timestamp_real(FILE *fp,
> +               }
> +               /* Print time in HH:MM:SS.ns */
> +               fprintf(fp, "%02d:%02d:%02d.%09" PRIu64,
> +-                      tm.tm_hour, tm.tm_min, tm.tm_sec, ts_nsec);
> ++                      tm.tm_hour, tm.tm_min, tm.tm_sec, ts_nsec_abs);
> +               goto end;
> +       }
> + seconds:
> +-      fprintf(fp, "%3" PRIu64 ".%09" PRIu64,
> +-              ts_sec, ts_nsec);
> ++        fprintf(fp, "%s%" PRId64 ".%09" PRIu64,
> ++                is_negative ? "-" : "", ts_sec_abs, ts_nsec_abs);
> +
> + end:
> +       return;
> +@@ -401,7 +458,7 @@ void ctf_print_timestamp_cycles(FILE *fp,
> +
> + void ctf_print_timestamp(FILE *fp,
> +               struct ctf_stream_definition *stream,
> +-              uint64_t timestamp)
> ++              int64_t timestamp)
> + {
> +       if (opt_clock_cycles) {
> +               ctf_print_timestamp_cycles(fp, stream, timestamp);
> +diff --git a/formats/ctf/events-private.h b/formats/ctf/events-private.h
> +index 9bea75d4..c47fd7d8 100644
> +--- a/formats/ctf/events-private.h
> ++++ b/formats/ctf/events-private.h
> +@@ -35,20 +35,20 @@
> + #include <babeltrace/clock-internal.h>
> +
> + static inline
> +-uint64_t ctf_get_real_timestamp(struct ctf_stream_definition *stream,
> +-                      uint64_t timestamp)
> ++int64_t ctf_get_real_timestamp(struct ctf_stream_definition *stream,
> ++                      uint64_t ts_cycles)
> + {
> +-      uint64_t ts_nsec;
> ++      int64_t ts_nsec;
> +       struct ctf_trace *trace =3D stream->stream_class->trace;
> +       struct trace_collection *tc =3D trace->parent.collection;
> +-      uint64_t tc_offset;
> ++      int64_t tc_offset;
> +
> +       if (tc->clock_use_offset_avg)
> +               tc_offset =3D tc->single_clock_offset_avg;
> +       else
> +               tc_offset =3D clock_offset_ns(trace->parent.single_clock)=
;
> +
> +-      ts_nsec =3D clock_cycles_to_ns(stream->current_clock, timestamp);
> ++      ts_nsec =3D clock_cycles_to_ns(stream->current_clock, ts_cycles);
> +       ts_nsec +=3D tc_offset;   /* Add offset */
> +       return ts_nsec;
> + }
> +diff --git a/formats/ctf/events.c b/formats/ctf/events.c
> +index bd195b93..c5aefd82 100644
> +--- a/formats/ctf/events.c
> ++++ b/formats/ctf/events.c
> +@@ -315,18 +315,19 @@ int bt_ctf_event_get_handle_id(const struct bt_ctf=
_event *ctf_event)
> +       return ret;
> + }
> +
> +-uint64_t bt_ctf_get_timestamp(const struct bt_ctf_event *ctf_event)
> ++int bt_ctf_get_timestamp(const struct bt_ctf_event *ctf_event, int64_t =
*timestamp)
> + {
> +       const struct ctf_event_definition *event;
> +
> +-      if (!ctf_event)
> +-              return -1ULL;
> ++      if (!ctf_event || !timestamp)
> ++              return -1;
> +
> +       event =3D ctf_event->parent;
> +       if (event && event->stream->has_timestamp)
> +-              return event->stream->real_timestamp;
> ++              *timestamp =3D event->stream->real_timestamp;
> +       else
> +-              return -1ULL;
> ++              return -1;
> ++      return 0;
> + }
> +
> + uint64_t bt_ctf_get_cycles(const struct bt_ctf_event *ctf_event)
> +diff --git a/formats/ctf/metadata/ctf-visitor-generate-io-struct.c b/for=
mats/ctf/metadata/ctf-visitor-generate-io-struct.c
> +index 8d348d66..dd8374fc 100644
> +--- a/formats/ctf/metadata/ctf-visitor-generate-io-struct.c
> ++++ b/formats/ctf/metadata/ctf-visitor-generate-io-struct.c
> +@@ -219,7 +219,6 @@ int get_unary_signed(struct bt_list_head *head, int6=
4_t *value)
> +
> +       bt_list_for_each_entry(node, head, siblings) {
> +               if (node->type !=3D NODE_UNARY_EXPRESSION
> +-                              || node->u.unary_expression.type !=3D UNA=
RY_UNSIGNED_CONSTANT
> +                               || (node->u.unary_expression.type !=3D UN=
ARY_UNSIGNED_CONSTANT && node->u.unary_expression.type !=3D UNARY_SIGNED_CO=
NSTANT)
> +                               || node->u.unary_expression.link !=3D UNA=
RY_LINK_UNKNOWN
> +                               || i !=3D 0)
> +diff --git a/include/babeltrace/babeltrace-internal.h b/include/babeltra=
ce/babeltrace-internal.h
> +index 6f8e2006..3e137e4c 100644
> +--- a/include/babeltrace/babeltrace-internal.h
> ++++ b/include/babeltrace/babeltrace-internal.h
> +@@ -178,8 +178,8 @@ struct trace_collection {
> +       GPtrArray *array;       /* struct bt_trace_descriptor */
> +       GHashTable *clocks;     /* struct ctf_clock */
> +
> +-      uint64_t single_clock_offset_avg;
> +-      uint64_t offset_first;
> ++      int64_t single_clock_offset_avg;
> ++      int64_t offset_first;
> +       int64_t delta_offset_first_sum;
> +       int offset_nr;
> +       int clock_use_offset_avg;
> +@@ -208,8 +208,8 @@ extern int opt_all_field_names,
> +       opt_clock_force_correlate,
> +       opt_debug_info_full_path;
> +
> +-extern uint64_t opt_clock_offset;
> +-extern uint64_t opt_clock_offset_ns;
> ++extern int64_t opt_clock_offset;
> ++extern int64_t opt_clock_offset_ns;
> + extern int babeltrace_ctf_console_output;
> + extern char *opt_debug_info_dir;
> + extern char *opt_debug_info_target_prefix;
> +diff --git a/include/babeltrace/clock-internal.h b/include/babeltrace/cl=
ock-internal.h
> +index cd6bdbae..86954b78 100644
> +--- a/include/babeltrace/clock-internal.h
> ++++ b/include/babeltrace/clock-internal.h
> +@@ -49,7 +49,7 @@ uint64_t clock_cycles_to_ns(struct ctf_clock *clock, u=
int64_t cycles)
> +  * mantissa.
> +  */
> + static inline
> +-uint64_t clock_offset_ns(struct ctf_clock *clock)
> ++int64_t clock_offset_ns(struct ctf_clock *clock)
> + {
> +       return clock->offset_s * 1000000000ULL
> +                       + clock_cycles_to_ns(clock, clock->offset);
> +diff --git a/include/babeltrace/ctf-ir/clock-internal.h b/include/babelt=
race/ctf-ir/clock-internal.h
> +index 75677707..f1e896b6 100644
> +--- a/include/babeltrace/ctf-ir/clock-internal.h
> ++++ b/include/babeltrace/ctf-ir/clock-internal.h
> +@@ -42,7 +42,7 @@ struct bt_ctf_clock {
> +       uint64_t precision;
> +       int64_t offset_s;       /* Offset in seconds */
> +       int64_t offset;         /* Offset in ticks */
> +-      uint64_t value;         /* Current clock value */
> ++      int64_t value;          /* Current clock value */
> +       uuid_t uuid;
> +       int uuid_set;
> +       int absolute;
> +diff --git a/include/babeltrace/ctf/events.h b/include/babeltrace/ctf/ev=
ents.h
> +index c81d8852..15830a30 100644
> +--- a/include/babeltrace/ctf/events.h
> ++++ b/include/babeltrace/ctf/events.h
> +@@ -109,10 +109,12 @@ const char *bt_ctf_event_name(const struct bt_ctf_=
event *event);
> + uint64_t bt_ctf_get_cycles(const struct bt_ctf_event *event);
> +
> + /*
> +- * bt_ctf_get_timestamp: returns the timestamp of the event offsetted
> +- * with the system clock source (in ns) or -1ULL on error
> ++ * bt_ctf_get_timestamp: get the timestamp of the event offsetted
> ++ * with the system clock source (in ns) in *timestamp.
> ++ *
> ++ * Return 0 on success, or -1ULL on error.
> +  */
> +-uint64_t bt_ctf_get_timestamp(const struct bt_ctf_event *event);
> ++int bt_ctf_get_timestamp(const struct bt_ctf_event *event, int64_t *tim=
estamp);
> +
> + /*
> +  * bt_ctf_get_field_list: obtain the list of fields for compound type
> +diff --git a/include/babeltrace/ctf/types.h b/include/babeltrace/ctf/typ=
es.h
> +index 0bc003c8..4b626b39 100644
> +--- a/include/babeltrace/ctf/types.h
> ++++ b/include/babeltrace/ctf/types.h
> +@@ -46,8 +46,8 @@
> + struct bt_stream_callbacks;
> +
> + struct packet_index_time {
> +-      uint64_t timestamp_begin;
> +-      uint64_t timestamp_end;
> ++      int64_t timestamp_begin;
> ++      int64_t timestamp_end;
> + };
> +
> + struct packet_index {
> +@@ -253,7 +253,7 @@ int ctf_pos_get_event(struct ctf_stream_pos *pos)
> + }
> +
> + void ctf_print_timestamp(FILE *fp, struct ctf_stream_definition *stream=
,
> +-                      uint64_t timestamp);
> ++                      int64_t timestamp);
> + int ctf_append_trace_metadata(struct bt_trace_descriptor *tdp,
> +                       FILE *metadata_fp);
> + void ctf_print_discarded_lost(FILE *fp, struct ctf_stream_definition *s=
tream);
> +diff --git a/include/babeltrace/format.h b/include/babeltrace/format.h
> +index dea8e0e5..bf33a239 100644
> +--- a/include/babeltrace/format.h
> ++++ b/include/babeltrace/format.h
> +@@ -73,10 +73,12 @@ struct bt_format {
> +                       struct bt_context *ctx);
> +       void (*set_handle)(struct bt_trace_descriptor *descriptor,
> +                       struct bt_trace_handle *handle);
> +-      uint64_t (*timestamp_begin)(struct bt_trace_descriptor *descripto=
r,
> +-                      struct bt_trace_handle *handle, enum bt_clock_typ=
e type);
> +-      uint64_t (*timestamp_end)(struct bt_trace_descriptor *descriptor,
> +-                      struct bt_trace_handle *handle, enum bt_clock_typ=
e type);
> ++        int (*timestamp_begin)(struct bt_trace_descriptor *descriptor,
> ++                        struct bt_trace_handle *handle, enum bt_clock_t=
ype type,
> ++                        int64_t *timestamp);
> ++        int (*timestamp_end)(struct bt_trace_descriptor *descriptor,
> ++                        struct bt_trace_handle *handle, enum bt_clock_t=
ype type,
> ++                        int64_t *timestamp);
> +       int (*convert_index_timestamp)(struct bt_trace_descriptor *descri=
ptor);
> + };
> +
> +diff --git a/include/babeltrace/trace-handle-internal.h b/include/babelt=
race/trace-handle-internal.h
> +index 5e9c1c6a..924c730c 100644
> +--- a/include/babeltrace/trace-handle-internal.h
> ++++ b/include/babeltrace/trace-handle-internal.h
> +@@ -46,10 +46,10 @@ struct bt_trace_handle {
> +       struct bt_trace_descriptor *td;
> +       struct bt_format *format;
> +       char path[PATH_MAX];
> +-      uint64_t real_timestamp_begin;
> +-      uint64_t real_timestamp_end;
> +-      uint64_t cycles_timestamp_begin;
> +-      uint64_t cycles_timestamp_end;
> ++      int64_t real_timestamp_begin;
> ++      int64_t real_timestamp_end;
> ++      int64_t cycles_timestamp_begin;
> ++      int64_t cycles_timestamp_end;
> + };
> +
> + /*
> +diff --git a/include/babeltrace/trace-handle.h b/include/babeltrace/trac=
e-handle.h
> +index 96e4a81b..55c850f8 100644
> +--- a/include/babeltrace/trace-handle.h
> ++++ b/include/babeltrace/trace-handle.h
> +@@ -53,20 +53,25 @@ struct bt_ctf_event;
> + const char *bt_trace_handle_get_path(struct bt_context *ctx, int handle=
_id);
> +
> + /*
> +- * bt_trace_handle_get_timestamp_begin : returns the creation time (in
> +- * nanoseconds or cycles depending on type) of the buffers of a trace
> +- * or -1ULL on error.
> ++ * bt_trace_handle_get_timestamp_begin : get the creation time (in
> ++ * nanoseconds or cycles depending on type) of the buffers of a trace.
> ++ *
> ++ * Returns 0 on success, -1 on error.
> +  */
> +-uint64_t bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
> +-              int handle_id, enum bt_clock_type type);
> ++int bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
> ++              int handle_id, enum bt_clock_type type,
> ++              int64_t *timestamp);
> +
> + /*
> +- * bt_trace_handle_get_timestamp_end : returns the destruction timestam=
p
> +- * (in nanoseconds or cycles depending on type) of the buffers of a tra=
ce
> +- * or -1ULL on error.
> ++ * bt_trace_handle_get_timestamp_end : get the destruction time
> ++ * (in nanoseconds or cycles depending on type) of the buffers of a
> ++ * trace.
> ++ *
> ++ * Returns 0 on success, -1 on error.
> +  */
> +-uint64_t bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
> +-              int handle_id, enum bt_clock_type type);
> ++int bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
> ++              int handle_id, enum bt_clock_type type,
> ++              int64_t *timestamp);
> +
> + /*
> +  * bt_ctf_event_get_handle_id : get the handle id associated with an ev=
ent
> +diff --git a/lib/context.c b/lib/context.c
> +index 87901b3c..34a1bc82 100644
> +--- a/lib/context.c
> ++++ b/lib/context.c
> +@@ -139,18 +139,38 @@ int bt_context_add_trace(struct bt_context *ctx, c=
onst char *path,
> +                       goto error_collection_del;
> +       }
> +
> +-      if (fmt->timestamp_begin)
> +-              handle->real_timestamp_begin =3D fmt->timestamp_begin(td,
> +-                              handle, BT_CLOCK_REAL);
> +-      if (fmt->timestamp_end)
> +-              handle->real_timestamp_end =3D fmt->timestamp_end(td, han=
dle,
> +-                              BT_CLOCK_REAL);
> +-      if (fmt->timestamp_begin)
> +-              handle->cycles_timestamp_begin =3D fmt->timestamp_begin(t=
d,
> +-                              handle, BT_CLOCK_CYCLES);
> +-      if (fmt->timestamp_end)
> +-              handle->cycles_timestamp_end =3D fmt->timestamp_end(td, h=
andle,
> +-                              BT_CLOCK_CYCLES);
> ++        if (fmt->timestamp_begin) {
> ++                ret =3D fmt->timestamp_begin(td, handle, BT_CLOCK_REAL,
> ++                                &handle->real_timestamp_begin);
> ++                if (ret < 0 && ret !=3D -ENOENT) {
> ++                        ret =3D -1;
> ++                        goto error_collection_del;
> ++                }
> ++        }
> ++        if (fmt->timestamp_end) {
> ++                ret =3D fmt->timestamp_end(td, handle, BT_CLOCK_REAL,
> ++                                &handle->real_timestamp_end);
> ++                if (ret < 0 && ret !=3D -ENOENT) {
> ++                        ret =3D -1;
> ++                        goto error_collection_del;
> ++                }
> ++        }
> ++        if (fmt->timestamp_begin) {
> ++                ret =3D fmt->timestamp_begin(td, handle, BT_CLOCK_CYCLE=
S,
> ++                                &handle->cycles_timestamp_begin);
> ++                if (ret < 0 && ret !=3D -ENOENT) {
> ++                        ret =3D -1;
> ++                        goto error_collection_del;
> ++                }
> ++        }
> ++        if (fmt->timestamp_end) {
> ++                ret =3D fmt->timestamp_end(td, handle, BT_CLOCK_CYCLES,
> ++                                &handle->cycles_timestamp_end);
> ++                if (ret < 0 && ret !=3D -ENOENT) {
> ++                        ret =3D -1;
> ++                        goto error_collection_del;
> ++                }
> ++        }
> +
> +       /* Add new handle to container */
> +       g_hash_table_insert(ctx->trace_handles,
> +diff --git a/lib/trace-handle.c b/lib/trace-handle.c
> +index d5b906aa..8f11c7cc 100644
> +--- a/lib/trace-handle.c
> ++++ b/lib/trace-handle.c
> +@@ -66,54 +66,57 @@ const char *bt_trace_handle_get_path(struct bt_conte=
xt *ctx, int handle_id)
> +       return handle->path;
> + }
> +
> +-uint64_t bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
> +-              int handle_id, enum bt_clock_type type)
> ++int bt_trace_handle_get_timestamp_begin(struct bt_context *ctx,
> ++              int handle_id, enum bt_clock_type type,
> ++              int64_t *timestamp)
> + {
> +       struct bt_trace_handle *handle;
> +-      uint64_t ret;
> +
> +-      if (!ctx)
> +-              return -1ULL;
> ++      int ret =3D 0;
> ++
> ++        if (!ctx || !timestamp)
> ++                return -1;
> +
> +       handle =3D g_hash_table_lookup(ctx->trace_handles,
> +                       (gpointer) (unsigned long) handle_id);
> +       if (!handle) {
> +-              ret =3D -1ULL;
> ++              ret =3D -1;
> +               goto end;
> +       }
> +       if (type =3D=3D BT_CLOCK_REAL) {
> +-              ret =3D handle->real_timestamp_begin;
> ++              *timestamp =3D handle->real_timestamp_begin;
> +       } else if (type =3D=3D BT_CLOCK_CYCLES) {
> +-              ret =3D handle->cycles_timestamp_begin;
> ++              *timestamp =3D handle->cycles_timestamp_begin;
> +       } else {
> +-              ret =3D -1ULL;
> ++              ret =3D -1;
> +       }
> +
> + end:
> +       return ret;
> + }
> +
> +-uint64_t bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
> +-              int handle_id, enum bt_clock_type type)
> ++int bt_trace_handle_get_timestamp_end(struct bt_context *ctx,
> ++              int handle_id, enum bt_clock_type type,
> ++              int64_t *timestamp)
> + {
> +       struct bt_trace_handle *handle;
> +-      uint64_t ret;
> ++      int ret =3D 0;
> +
> +-      if (!ctx)
> +-              return -1ULL;
> ++      if (!ctx || !timestamp)
> ++              return -1;
> +
> +       handle =3D g_hash_table_lookup(ctx->trace_handles,
> +                       (gpointer) (unsigned long) handle_id);
> +       if (!handle) {
> +-              ret =3D -1ULL;
> ++              ret =3D -1;
> +               goto end;
> +       }
> +       if (type =3D=3D BT_CLOCK_REAL) {
> +-              ret =3D handle->real_timestamp_end;
> ++              *timestamp =3D handle->real_timestamp_end;
> +       } else if (type =3D=3D BT_CLOCK_CYCLES) {
> +-              ret =3D handle->cycles_timestamp_end;
> ++              *timestamp =3D handle->cycles_timestamp_end;
> +       } else {
> +-              ret =3D -1ULL;
> ++              ret =3D -1;
> +       }
> +
> + end:
> +diff --git a/tests/lib/test_ctf_writer.c b/tests/lib/test_ctf_writer.c
> +index 53613c91..29d76df8 100644
> +--- a/tests/lib/test_ctf_writer.c
> ++++ b/tests/lib/test_ctf_writer.c
> +@@ -45,7 +45,7 @@
> + #define SEQUENCE_TEST_LENGTH 10
> + #define PACKET_RESIZE_TEST_LENGTH 100000
> +
> +-static uint64_t current_time;
> ++static int64_t current_time;
> +
> + void validate_metadata(char *parser_path, char *metadata_path)
> + {
> +@@ -695,8 +695,8 @@ int main(int argc, char **argv)
> +       const char *clock_name =3D "test_clock";
> +       const char *clock_description =3D "This is a test clock";
> +       const uint64_t frequency =3D 1000000000;
> +-      const uint64_t offset_s =3D 1351530929945824323;
> +-      const uint64_t offset =3D 1234567;
> ++      const int64_t offset_s =3D 1351530929945824323;
> ++      const int64_t offset =3D 1234567;
> +       const uint64_t precision =3D 10;
> +       char *metadata_string;
> +       struct bt_ctf_writer *writer;
> +diff --git a/tests/lib/test_seek.c b/tests/lib/test_seek.c
> +index 3c78e8ad..04beaf97 100644
> +--- a/tests/lib/test_seek.c
> ++++ b/tests/lib/test_seek.c
> +@@ -33,7 +33,7 @@
> + #include <tap/tap.h>
> + #include "common.h"
> +
> +-#define NR_TESTS      29
> ++#define NR_TESTS      36
> +
> + void run_seek_begin(char *path, uint64_t expected_begin)
> + {
> +@@ -42,8 +42,8 @@ void run_seek_begin(char *path, uint64_t expected_begi=
n)
> +       struct bt_ctf_event *event;
> +       struct bt_iter_pos newpos;
> +       int ret;
> +-      uint64_t timestamp_begin;
> +-      uint64_t timestamp_seek_begin;
> ++      int64_t timestamp_begin;
> ++      int64_t timestamp_seek_begin;
> +       unsigned int nr_seek_begin_test;
> +
> +       nr_seek_begin_test =3D 5;
> +@@ -67,7 +67,7 @@ void run_seek_begin(char *path, uint64_t expected_begi=
n)
> +       ok(event, "Event valid");
> +
> +       /* Validate that the first timestamp is right */
> +-      timestamp_begin =3D bt_ctf_get_timestamp(event);
> ++      ok1(bt_ctf_get_timestamp(event, &timestamp_begin) =3D=3D 0);
> +
> +       ok1(timestamp_begin =3D=3D expected_begin);
> +
> +@@ -81,8 +81,8 @@ void run_seek_begin(char *path, uint64_t expected_begi=
n)
> +
> +       ok(event, "Event valid");
> +
> +-      timestamp_seek_begin =3D bt_ctf_get_timestamp(event);
> +-
> ++      ok1(bt_ctf_get_timestamp(event, &timestamp_seek_begin) =3D=3D 0);
> ++
> +       ok1(timestamp_begin =3D=3D timestamp_seek_begin);
> +
> +       bt_context_put(ctx);
> +@@ -96,7 +96,7 @@ void run_seek_last(char *path, uint64_t expected_last)
> +       struct bt_ctf_event *event;
> +       struct bt_iter_pos newpos;
> +       int ret;
> +-      uint64_t timestamp_last;
> ++      int64_t timestamp_last;
> +       unsigned int nr_seek_last_tests;
> +
> +       nr_seek_last_tests =3D 6;
> +@@ -129,7 +129,7 @@ void run_seek_last(char *path, uint64_t expected_las=
t)
> +
> +       ok(event, "Event valid at last position");
> +
> +-      timestamp_last =3D bt_ctf_get_timestamp(event);
> ++      ok1(bt_ctf_get_timestamp(event, &timestamp_last) =3D=3D 0);
> +
> +       ok1(timestamp_last =3D=3D expected_last);
> +
> +@@ -152,7 +152,7 @@ void run_seek_time_at_last(char *path, uint64_t expe=
cted_last)
> +       struct bt_ctf_event *event;
> +       struct bt_iter_pos newpos;
> +       int ret;
> +-      uint64_t timestamp_last;
> ++      int64_t timestamp_last;
> +       unsigned int nr_seek_time_at_last_tests;
> +
> +       nr_seek_time_at_last_tests =3D 6;
> +@@ -188,7 +188,7 @@ void run_seek_time_at_last(char *path, uint64_t expe=
cted_last)
> +
> +       ok(event, "Event valid at last position");
> +
> +-      timestamp_last =3D bt_ctf_get_timestamp(event);
> ++      ok1(bt_ctf_get_timestamp(event, &timestamp_last) =3D=3D 0);
> +
> +       ok1(timestamp_last =3D=3D expected_last);
> +
> +@@ -213,7 +213,7 @@ void run_seek_cycles(char *path,
> +       struct bt_ctf_event *event;
> +       struct bt_iter_pos newpos;
> +       int ret;
> +-      uint64_t timestamp;
> ++      int64_t timestamp;
> +
> +       unsigned int nr_seek_cycles_tests;
> +
> +@@ -247,7 +247,7 @@ void run_seek_cycles(char *path,
> +
> +       ok(event, "Event valid at last position");
> +
> +-      timestamp =3D bt_ctf_get_timestamp(event);
> ++      ok1(bt_ctf_get_timestamp(event, &timestamp) =3D=3D 0);
> +
> +       ok1(timestamp =3D=3D expected_last);
> +
> +@@ -270,7 +270,7 @@ void run_seek_cycles(char *path,
> +
> +       ok(event, "Event valid at first position");
> +
> +-      timestamp =3D bt_ctf_get_timestamp(event);
> ++      ok1(bt_ctf_get_timestamp(event, &timestamp) =3D=3D 0);
> +
> +       ok1(timestamp =3D=3D expected_begin);
> +
> +@@ -284,7 +284,7 @@ void run_seek_cycles(char *path,
> +
> +       ok(event, "Event valid at last position");
> +
> +-      timestamp =3D bt_ctf_get_timestamp(event);
> ++      ok1(bt_ctf_get_timestamp(event, &timestamp) =3D=3D 0);
> +
> +       ok1(timestamp =3D=3D expected_last);
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace/0002-babeltrace-fix-bug=
-in-stream-intersection-option.patch b/meta/recipes-kernel/lttng/babeltrace=
/0002-babeltrace-fix-bug-in-stream-intersection-option.patch
> new file mode 100644
> index 0000000000..cd06ec517c
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace/0002-babeltrace-fix-bug-in-str=
eam-intersection-option.patch
> @@ -0,0 +1,114 @@
> +From 04582ee50791df39c34da2a8c81101a64c79a3bd Mon Sep 17 00:00:00 2001
> +From: Heng Guo <heng.guo@windriver.com>
> +Date: Thu, 17 Mar 2022 12:26:12 +0800
> +Subject: [PATCH 2/2] babeltrace: fix bug in --stream-intersection option
> +
> +If --stream-intersection option is used to filter trace, wrong result
> +is got by babeltrace with commit: 61cf588beae752e5ddfc60b6b5310f769ac9e8=
52.
> +Fix it using INT64 instead of UINT64 in related codes.
> +
> +Upstream-Status: Inappropriate
> +[https://bugs.lttng.org/attachments/538]
> +
> +Signed-off-by: Heng Guo <heng.guo@windriver.com>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + formats/ctf/ctf.c                        | 8 ++++----
> + formats/ctf/iterator.c                   | 2 +-
> + include/babeltrace/ctf/events-internal.h | 2 +-
> + include/babeltrace/iterator.h            | 4 ++--
> + lib/iterator.c                           | 2 +-
> + 5 files changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/formats/ctf/ctf.c b/formats/ctf/ctf.c
> +index 3c774188..86f4e02e 100644
> +--- a/formats/ctf/ctf.c
> ++++ b/formats/ctf/ctf.c
> +@@ -973,8 +973,8 @@ int ctf_find_stream_intersection(struct bt_trace_des=
criptor *td_read,
> +               struct packet_index_time *_cycles)
> + {
> +       int stream_id, ret =3D 0;
> +-      struct packet_index_time real =3D { 0, UINT64_MAX },
> +-                      cycles =3D { 0, UINT64_MAX };
> ++      struct packet_index_time real =3D { INT64_MIN, INT64_MAX },
> ++                        cycles =3D { INT64_MIN, INT64_MAX };
> +       struct ctf_trace *tin =3D container_of(td_read, struct ctf_trace,=
 parent);
> +
> +       /* At least one of the two return args must be provided. */
> +@@ -1050,10 +1050,10 @@ end:
> +  * Return a negative value on error.
> +  */
> + int ctf_find_tc_stream_packet_intersection_union(struct bt_context *ctx=
,
> +-              uint64_t *_ts_begin, uint64_t *_ts_end)
> ++              int64_t *_ts_begin, int64_t *_ts_end)
> + {
> +       int ret =3D 0, i;
> +-      uint64_t ts_begin =3D UINT64_MAX, ts_end =3D 0;
> ++      int64_t ts_begin =3D INT64_MAX, ts_end =3D INT64_MIN;
> +
> +       if (!ctx || !ctx->tc || !ctx->tc->array || !_ts_begin || !_ts_end=
) {
> +               ret =3D -EINVAL;
> +diff --git a/formats/ctf/iterator.c b/formats/ctf/iterator.c
> +index 7ef3e0b1..31bb30c3 100644
> +--- a/formats/ctf/iterator.c
> ++++ b/formats/ctf/iterator.c
> +@@ -68,7 +68,7 @@ struct bt_ctf_iter *bt_ctf_iter_create_intersect(struc=
t bt_context *ctx,
> +               struct bt_iter_pos **inter_end_pos)
> + {
> +       int ret;
> +-      uint64_t begin, end;
> ++      int64_t begin, end;
> +
> +       /*
> +        * The iterator's range is the union of each trace's intersection=
 of
> +diff --git a/include/babeltrace/ctf/events-internal.h b/include/babeltra=
ce/ctf/events-internal.h
> +index 09786593..b6d9813e 100644
> +--- a/include/babeltrace/ctf/events-internal.h
> ++++ b/include/babeltrace/ctf/events-internal.h
> +@@ -85,7 +85,7 @@ void ctf_update_current_packet_index(struct ctf_stream=
_definition *stream,
> +               struct packet_index *prev_index,
> +               struct packet_index *cur_index);
> + int ctf_find_tc_stream_packet_intersection_union(struct bt_context *ctx=
,
> +-              uint64_t *ts_begin, uint64_t *ts_end);
> ++              int64_t *ts_begin, int64_t *ts_end);
> + int ctf_tc_set_stream_intersection_mode(struct bt_context *ctx);
> +
> + #endif /*_BABELTRACE_CTF_EVENTS_INTERNAL_H */
> +diff --git a/include/babeltrace/iterator.h b/include/babeltrace/iterator=
.h
> +index 5c3939c3..ad9f7edf 100644
> +--- a/include/babeltrace/iterator.h
> ++++ b/include/babeltrace/iterator.h
> +@@ -77,7 +77,7 @@ enum bt_iter_pos_type {
> + struct bt_iter_pos {
> +       enum bt_iter_pos_type type;
> +       union {
> +-              uint64_t seek_time;
> ++              int64_t seek_time;
> +               struct bt_saved_pos *restore;
> +       } u;
> + };
> +@@ -124,7 +124,7 @@ int bt_iter_set_pos(struct bt_iter *iter, const stru=
ct bt_iter_pos *pos);
> +  * real timestamp.
> +  */
> + struct bt_iter_pos *bt_iter_create_time_pos(struct bt_iter *iter,
> +-              uint64_t timestamp);
> ++              int64_t timestamp);
> +
> + #ifdef __cplusplus
> + }
> +diff --git a/lib/iterator.c b/lib/iterator.c
> +index 77093217..c73ffa1c 100644
> +--- a/lib/iterator.c
> ++++ b/lib/iterator.c
> +@@ -636,7 +636,7 @@ error:
> + }
> +
> + struct bt_iter_pos *bt_iter_create_time_pos(struct bt_iter *unused,
> +-              uint64_t timestamp)
> ++              int64_t timestamp)
> + {
> +       struct bt_iter_pos *pos;
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes=
-kernel/lttng/babeltrace_1.5.8.bb
> index 19601e7d1b..dc207b544d 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
> @@ -9,6 +9,8 @@ DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-n=
ative"
>
>  SRC_URI =3D "git://git.efficios.com/babeltrace.git;branch=3Dstable-1.5 \
>            file://run-ptest \
> +          file://0001-Handle-negative-time-and-offset-from-Epoch.patch \
> +          file://0002-babeltrace-fix-bug-in-stream-intersection-option.p=
atch \
>           "
>  SRCREV =3D "054a54ae10b01a271afc4f19496c041b10fb414c"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>1(\.\d+)+)$"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171049): https://lists.openembedded.org/g/openembedde=
d-core/message/171049
> Mute This Topic: https://lists.openembedded.org/mt/93919798/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B90FD41D6A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 16:57:14 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14415.1765472223543041982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 08:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Sg4ggOkC;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-787d5555274so3335357b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 08:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765472222; x=1766077022; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIdARjoW7VmxM/+Bh6rArHVPh9HL+JOAkOI6keQZUe4=;
        b=Sg4ggOkCtQ22PqsemNiA9f2wPwwoRmGDwlknixoYSDUVQ8oIOagFrH8D8WjXRQPaMs
         g+6/6L1Tco67bPzz5gnHKku2r8xkwpHtAsPDs/msrkO4zN8FnV73t88IvMN9YVG65s+8
         a+/Zq1kdWLr47KCY9Vs0zISCEnVg6iSJxah5wR9DQ1sTBxVjBEc7YAckqbs91jfWBg4y
         EBaC/h63c2kONTHOov9jRslA0FKR4+1tz5XxzYJEbdDZUe30r4KyAK1q3+wJBVZgU+sF
         VtvTH/PMZHLVJ9ymtCdDdlYWTTQqsJnzhDK42bbOoBCRBetNksYkRAney1Bhba01m5+8
         HRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765472222; x=1766077022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VIdARjoW7VmxM/+Bh6rArHVPh9HL+JOAkOI6keQZUe4=;
        b=RFkqVUrY46BB87XIX5Jb5YSb26LXg8vhokhjo2tNr3w46UseGKPcYiaZ0Az8txE5S6
         GoegiAD05Ouvh7Zt2bQqNOhWMEQB6xuwi6wNqTOSTjFOeCmbPfkHSef6qxIH/zy024M1
         ISzZcDyYtbMUkbXq5ETnLHwQslMTzywNrS+amod2/0+2DVs3QbabTHhUfEsfhRwSYvoc
         jUg3JMdJTWgoSdPPO22K+uWFeTxU8kEql3oEC4i3kdduDKDq5AvW24USa1Dnbyh7kFGG
         MflxtinKdye+ZnuIB+EY3S/EJ8Sm7zGzAniDO6UTO4KJmdEcih6vaGXpIVcEBVrDWfqu
         poXw==
X-Gm-Message-State: AOJu0Yyu5MWyHo0AxYtJlHVWr7kfXT6UmAPJZa0zw5KMMGnbfu0ncpuE
	Gt3lwWGrzaWCjfqnkZ+nXHeyfMs8ZWSL58maQwZBuvufmnbufzMftXhfv1PFAh0yxn98Vqu+zvn
	2Hb4L3BgRwhJKLymh+a99rtHfXr9jJnMQyGFoMSKt6fHCQPZbU7Af02Y=
X-Gm-Gg: AY/fxX5HpUDKNzYemLss18Y4KdTVSvlq6lAX5w1vpm7UW+/MTZO2ycyOVRBhnr/KBvf
	FwCMlb3eCb+dccATuv25FE/Wr7EdohicQdEpLwODvRlhHOHBiMW7Ajd5fjM56oqEDmI22C2nzTb
	1uVzDrkvTtrMmsLhMga3Hs6TGjjuV7R5HXDhNs60XIM2Tm0PK9gFcBnCvdGBQGQo0NSgO3cII82
	ld9e4ShXclqJWVPnYm4DDOSd2oat6dyKR69OjwqFr8WwT48Tg1itFBu//lyyFwS+laTtYPZMtOI
	PvJKdUj4rYiyCtFKZqObjAsCodY=
X-Google-Smtp-Source: AGHT+IEQo0rThCefE709R00vLZIbUWGrWcPo+NsyzpdU1VSAxwlfO+mX4DFcPs42ncYsO+21i4PBsLcUsc4zFC2K2GA=
X-Received: by 2002:a05:690e:118e:b0:63f:a5ff:46a4 with SMTP id
 956f58d0204a3-6446e8fbc61mr5227600d50.6.1765472222315; Thu, 11 Dec 2025
 08:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20251210150857.2780243-1-deeratho@cisco.com>
In-Reply-To: <20251210150857.2780243-1-deeratho@cisco.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 11 Dec 2025 08:56:50 -0800
X-Gm-Features: AQt7F2rIBvk2HsCw3wCNe6LFhi87ssTUtXPqVeUId4uxf4h7yJPR-YULmyI59tU
Message-ID: <CAOSpxdZKx5XYfxpecmFfhyc8ZZOs6m6t2=oMcjd0RgjQW7mnjw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/2] cups 2.4.11: Fix CVE-2025-58436
To: deeratho@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 16:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227551

I'm getting failures with this patchset:

ERROR: cups-2.4.11-r0 do_patch: QA Issue: Fuzz detected:
Applying patch CVE-2025-58436.patch
patching file cups/http-private.h
Hunk #3 succeeded at 308 with fuzz 2.
patching file cups/http.c
patching file cups/tls-openssl.c
patching file scheduler/client.c
patching file scheduler/client.h
patching file scheduler/select.c
Hunk #2 succeeded at 455 with fuzz 1.
The context lines in the patches can be updated with devtool:
devtool modify cups
devtool finish --force-patch-refresh cups <layer_path>
Don't forget to review changes done by devtool!
Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: cups-2.4.11-r0 do_patch: Fatal QA errors were found, failing task.
NOTE: recipe python3-maturin-1.4.0-r0: task do_fetch: Started
NOTE: recipe lib32-vte-0.74.2-r0: task do_write_config: Succeeded
ERROR: lib32-cups-2.4.11-r0 do_patch: QA Issue: Fuzz detected:
Applying patch CVE-2025-58436.patch
patching file cups/http-private.h
Hunk #3 succeeded at 308 with fuzz 2.
patching file cups/http.c
patching file cups/tls-openssl.c
patching file scheduler/client.c
patching file scheduler/client.h
patching file scheduler/select.c
Hunk #2 succeeded at 455 with fuzz 1.
The context lines in the patches can be updated with devtool:
devtool modify lib32-cups
devtool finish --force-patch-refresh lib32-cups <layer_path>
Don't forget to review changes done by devtool!
Patch log indicates that patches do not apply cleanly. [patch-fuzz]
ERROR: lib32-cups-2.4.11-r0 do_patch: Fatal QA errors were found, failing t=
ask.

Please also check that your second patch doesn't have fuzz errors and
send a v2 for both.

Thanks!

Steve


On Wed, Dec 10, 2025 at 7:09=E2=80=AFAM Deepak Rathore via
lists.openembedded.org <deeratho=3Dcisco.com@lists.openembedded.org>
wrote:
>
> From: Deepak Rathore <deeratho@cisco.com>
>
> Upstream Repository: https://github.com/OpenPrinting/cups.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-58436
> Type: Security Fix
> CVE: CVE-2025-58436
> Score: 5.5
> Patch: https://github.com/OpenPrinting/cups/commit/5d414f1f91bd
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index 0a26a9b6de..cf3df32306 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -17,6 +17,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
>             file://cups-volatiles.conf \
>             file://CVE-2025-58060.patch \
>             file://CVE-2025-58364.patch \
> +           file://CVE-2025-58436.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
> diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58436.patch b/meta/=
recipes-extended/cups/cups/CVE-2025-58436.patch
> new file mode 100644
> index 0000000000..ebb68dabe9
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/CVE-2025-58436.patch
> @@ -0,0 +1,634 @@
> +From d8707cbc36ce3daf03a8bc683b347359e058b9f6 Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Mon, 13 Oct 2025 10:16:48 +0200
> +Subject: [PATCH] Fix unresponsive cupsd process caused by a slow client
> +
> +If client is very slow, it will slow cupsd process for other clients.
> +The fix is the best effort without turning scheduler cupsd into
> +multithreaded process which would be too complex and error-prone when
> +backporting to 2.4.x series.
> +
> +The fix for unencrypted communication is to follow up on communication
> +only if there is the whole line on input, and the waiting time is
> +guarded by timeout.
> +
> +Encrypted communication now starts after we have the whole client hello
> +packet, which conflicts with optional upgrade support to HTTPS via
> +methods other than method OPTIONS, so this optional support defined in
> +RFC 2817, section 3.1 is removed. Too slow or incomplete requests are
> +handled by connection timeout.
> +
> +Fixes CVE-2025-58436
> +
> +CVE: CVE-2025-58436
> +Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/5=
d414f1f91bd]
> +
> +(cherry picked from commit 5d414f1f91bdca118413301b148f0b188eb1cdc6)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + cups/http-private.h |   7 +-
> + cups/http.c         |  80 +++++++++++++-------
> + cups/tls-openssl.c  |  15 +++-
> + scheduler/client.c  | 178 ++++++++++++++++++++++++++++----------------
> + scheduler/client.h  |   3 +
> + scheduler/select.c  |  12 +++
> + 6 files changed, 198 insertions(+), 97 deletions(-)
> +
> +diff --git a/cups/http-private.h b/cups/http-private.h
> +index 5f77b8ef0..b8e200bf6 100644
> +--- a/cups/http-private.h
> ++++ b/cups/http-private.h
> +@@ -121,6 +121,7 @@ extern "C" {
> +  * Constants...
> +  */
> +
> ++#  define _HTTP_MAX_BUFFER    32768   /* Size of read buffer */
> + #  define _HTTP_MAX_SBUFFER   65536   /* Size of (de)compression buffer=
 */
> + #  define _HTTP_RESOLVE_DEFAULT       0       /* Just resolve with defa=
ult options */
> + #  define _HTTP_RESOLVE_STDERR        1       /* Log resolve progress t=
o stderr */
> +@@ -232,8 +233,8 @@ struct _http_s                             /**** HTT=
P connection structure ****/
> +   http_encoding_t     data_encoding;  /* Chunked or not */
> +   int                 _data_remaining;/* Number of bytes left (deprecat=
ed) */
> +   int                 used;           /* Number of bytes used in buffer=
 */
> +-  char                        buffer[HTTP_MAX_BUFFER];
> +-                                      /* Buffer for incoming data */
> ++  char                        _buffer[HTTP_MAX_BUFFER];
> ++                                      /* Old read buffer (deprecated) *=
/
> +   int                 _auth_type;     /* Authentication in use (depreca=
ted) */
> +   unsigned char               _md5_state[88]; /* MD5 state (deprecated)=
 */
> +   char                        nonce[HTTP_MAX_VALUE];
> +@@ -307,6 +308,8 @@ struct _http_s                             /**** HTT=
P connection structure ****/
> +                                       /* Allocated field values */
> +                       *default_fields[HTTP_FIELD_MAX];
> +                                       /* Default field values, if any *=
/
> ++  char                        buffer[_HTTP_MAX_BUFFER];
> ++                                      /* Read buffer */
> + };
> + #  endif /* !_HTTP_NO_PRIVATE */
> +
> +diff --git a/cups/http.c b/cups/http.c
> +index 31a8be361..599703c7b 100644
> +--- a/cups/http.c
> ++++ b/cups/http.c
> +@@ -53,7 +53,7 @@ static http_t                *http_create(const char *=
host, int port,
> + static void           http_debug_hex(const char *prefix, const char *bu=
ffer,
> +                                      int bytes);
> + #endif /* DEBUG */
> +-static ssize_t                http_read(http_t *http, char *buffer, siz=
e_t length);
> ++static ssize_t                http_read(http_t *http, char *buffer, siz=
e_t length, int timeout);
> + static ssize_t                http_read_buffered(http_t *http, char *bu=
ffer, size_t length);
> + static ssize_t                http_read_chunk(http_t *http, char *buffe=
r, size_t length);
> + static int            http_send(http_t *http, http_state_t request,
> +@@ -1200,7 +1200,7 @@ httpGets(char   *line,                   /* I - Li=
ne to read into */
> +         return (NULL);
> +       }
> +
> +-      bytes =3D http_read(http, http->buffer + http->used, (size_t)(HTT=
P_MAX_BUFFER - http->used));
> ++      bytes =3D http_read(http, http->buffer + http->used, (size_t)(_HT=
TP_MAX_BUFFER - http->used), http->wait_value);
> +
> +       DEBUG_printf(("4httpGets: read " CUPS_LLFMT " bytes.", CUPS_LLCAS=
T bytes));
> +
> +@@ -1720,24 +1720,13 @@ httpPeek(http_t *http,                 /* I - HT=
TP connection */
> +
> +     ssize_t   buflen;                 /* Length of read for buffer */
> +
> +-    if (!http->blocking)
> +-    {
> +-      while (!httpWait(http, http->wait_value))
> +-      {
> +-      if (http->timeout_cb && (*http->timeout_cb)(http, http->timeout_d=
ata))
> +-        continue;
> +-
> +-      return (0);
> +-      }
> +-    }
> +-
> +     if ((size_t)http->data_remaining > sizeof(http->buffer))
> +       buflen =3D sizeof(http->buffer);
> +     else
> +       buflen =3D (ssize_t)http->data_remaining;
> +
> +     DEBUG_printf(("2httpPeek: Reading %d bytes into buffer.", (int)bufl=
en));
> +-    bytes =3D http_read(http, http->buffer, (size_t)buflen);
> ++    bytes =3D http_read(http, http->buffer, (size_t)buflen, http->wait_=
value);
> +
> +     DEBUG_printf(("2httpPeek: Read " CUPS_LLFMT " bytes into buffer.",
> +                   CUPS_LLCAST bytes));
> +@@ -1758,9 +1747,9 @@ httpPeek(http_t *http,                   /* I - HT=
TP connection */
> +     int               zerr;                   /* Decompressor error */
> +     z_stream  stream;                 /* Copy of decompressor stream */
> +
> +-    if (http->used > 0 && ((z_stream *)http->stream)->avail_in < HTTP_M=
AX_BUFFER)
> ++    if (http->used > 0 && ((z_stream *)http->stream)->avail_in < _HTTP_=
MAX_BUFFER)
> +     {
> +-      size_t buflen =3D HTTP_MAX_BUFFER - ((z_stream *)http->stream)->a=
vail_in;
> ++      size_t buflen =3D _HTTP_MAX_BUFFER - ((z_stream *)http->stream)->=
avail_in;
> +                                       /* Number of bytes to copy */
> +
> +       if (((z_stream *)http->stream)->avail_in > 0 &&
> +@@ -2018,7 +2007,7 @@ httpRead2(http_t *http,                  /* I - HT=
TP connection */
> +
> +       if (bytes =3D=3D 0)
> +       {
> +-        ssize_t buflen =3D HTTP_MAX_BUFFER - (ssize_t)((z_stream *)http=
->stream)->avail_in;
> ++        ssize_t buflen =3D _HTTP_MAX_BUFFER - (ssize_t)((z_stream *)htt=
p->stream)->avail_in;
> +                                       /* Additional bytes for buffer */
> +
> +         if (buflen > 0)
> +@@ -2768,7 +2757,7 @@ int                                      /* O - 1 =
to continue, 0 to stop */
> + _httpUpdate(http_t        *http,      /* I - HTTP connection */
> +             http_status_t *status)    /* O - Current HTTP status */
> + {
> +-  char                line[32768],            /* Line from connection..=
. */
> ++  char                line[_HTTP_MAX_BUFFER], /* Line from connection..=
. */
> +               *value;                 /* Pointer to value on line */
> +   http_field_t        field;                  /* Field index */
> +   int         major, minor;           /* HTTP version numbers */
> +@@ -2776,12 +2765,46 @@ _httpUpdate(http_t        *http,       /* I - HT=
TP connection */
> +
> +   DEBUG_printf(("_httpUpdate(http=3D%p, status=3D%p), state=3D%s", (voi=
d *)http, (void *)status, httpStateString(http->state)));
> +
> ++  /* When doing non-blocking I/O, make sure we have a whole line... */
> ++  if (!http->blocking)
> ++  {
> ++    ssize_t   bytes;                  /* Bytes "peeked" from connection=
 */
> ++
> ++    /* See whether our read buffer is full... */
> ++    DEBUG_printf(("2_httpUpdate: used=3D%d", http->used));
> ++
> ++    if (http->used > 0 && !memchr(http->buffer, '\n', (size_t)http->use=
d) && (size_t)http->used < sizeof(http->buffer))
> ++    {
> ++      /* No, try filling in more data... */
> ++      if ((bytes =3D http_read(http, http->buffer + http->used, sizeof(=
http->buffer) - (size_t)http->used, /*timeout*/0)) > 0)
> ++      {
> ++      DEBUG_printf(("2_httpUpdate: Read %d bytes.", (int)bytes));
> ++      http->used +=3D (int)bytes;
> ++      }
> ++    }
> ++
> ++    /* Peek at the incoming data... */
> ++    if (!http->used || !memchr(http->buffer, '\n', (size_t)http->used))
> ++    {
> ++      /* Don't have a full line, tell the reader to try again when ther=
e is more data... */
> ++      DEBUG_puts("1_htttpUpdate: No newline in buffer yet.");
> ++      if ((size_t)http->used =3D=3D sizeof(http->buffer))
> ++      *status =3D HTTP_STATUS_ERROR;
> ++      else
> ++      *status =3D HTTP_STATUS_CONTINUE;
> ++      return (0);
> ++    }
> ++
> ++    DEBUG_puts("2_httpUpdate: Found newline in buffer.");
> ++  }
> ++
> +  /*
> +   * Grab a single line from the connection...
> +   */
> +
> +   if (!httpGets(line, sizeof(line), http))
> +   {
> ++    DEBUG_puts("1_httpUpdate: Error reading request line.");
> +     *status =3D HTTP_STATUS_ERROR;
> +     return (0);
> +   }
> +@@ -4134,7 +4157,8 @@ http_debug_hex(const char *prefix,       /* I - Pr=
efix for line */
> + static ssize_t                                /* O - Number of bytes re=
ad or -1 on error */
> + http_read(http_t *http,                       /* I - HTTP connection */
> +           char   *buffer,             /* I - Buffer */
> +-          size_t length)              /* I - Maximum bytes to read */
> ++          size_t length,              /* I - Maximum bytes to read */
> ++          int    timeout)             /* I - Wait timeout */
> + {
> +   ssize_t     bytes;                  /* Bytes read */
> +
> +@@ -4143,7 +4167,7 @@ http_read(http_t *http,                  /* I - HT=
TP connection */
> +
> +   if (!http->blocking || http->timeout_value > 0.0)
> +   {
> +-    while (!httpWait(http, http->wait_value))
> ++    while (!_httpWait(http, timeout, 1))
> +     {
> +       if (http->timeout_cb && (*http->timeout_cb)(http, http->timeout_d=
ata))
> +       continue;
> +@@ -4246,7 +4270,7 @@ http_read_buffered(http_t *http, /* I - HTTP conne=
ction */
> +     else
> +       bytes =3D (ssize_t)length;
> +
> +-    DEBUG_printf(("8http_read: Grabbing %d bytes from input buffer.",
> ++    DEBUG_printf(("8http_read_buffered: Grabbing %d bytes from input bu=
ffer.",
> +                   (int)bytes));
> +
> +     memcpy(buffer, http->buffer, (size_t)bytes);
> +@@ -4256,7 +4280,7 @@ http_read_buffered(http_t *http, /* I - HTTP conne=
ction */
> +       memmove(http->buffer, http->buffer + bytes, (size_t)http->used);
> +   }
> +   else
> +-    bytes =3D http_read(http, buffer, length);
> ++    bytes =3D http_read(http, buffer, length, http->wait_value);
> +
> +   return (bytes);
> + }
> +@@ -4597,15 +4621,15 @@ http_set_timeout(int    fd,            /* I - Fi=
le descriptor */
> + static void
> + http_set_wait(http_t *http)           /* I - HTTP connection */
> + {
> +-  if (http->blocking)
> +-  {
> +-    http->wait_value =3D (int)(http->timeout_value * 1000);
> ++  http->wait_value =3D (int)(http->timeout_value * 1000);
> +
> +-    if (http->wait_value <=3D 0)
> ++  if (http->wait_value <=3D 0)
> ++  {
> ++    if (http->blocking)
> +       http->wait_value =3D 60000;
> ++    else
> ++      http->wait_value =3D 1000;
> +   }
> +-  else
> +-    http->wait_value =3D 10000;
> + }
> +
> +
> +diff --git a/cups/tls-openssl.c b/cups/tls-openssl.c
> +index 9fcbe0af3..f746f4cba 100644
> +--- a/cups/tls-openssl.c
> ++++ b/cups/tls-openssl.c
> +@@ -215,12 +215,14 @@ cupsMakeServerCredentials(
> +   // Save them...
> +   if ((bio =3D BIO_new_file(keyfile, "wb")) =3D=3D NULL)
> +   {
> ++    DEBUG_printf(("1cupsMakeServerCredentials: Unable to create private=
 key file '%s': %s", keyfile, strerror(errno)));
> +     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, strerror(errno), 0);
> +     goto done;
> +   }
> +
> +   if (!PEM_write_bio_PrivateKey(bio, pkey, NULL, NULL, 0, NULL, NULL))
> +   {
> ++    DEBUG_puts("1cupsMakeServerCredentials: PEM_write_bio_PrivateKey fa=
iled.");
> +     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to write private=
 key."), 1);
> +     BIO_free(bio);
> +     goto done;
> +@@ -230,12 +232,14 @@ cupsMakeServerCredentials(
> +
> +   if ((bio =3D BIO_new_file(crtfile, "wb")) =3D=3D NULL)
> +   {
> ++    DEBUG_printf(("1cupsMakeServerCredentials: Unable to create certifi=
cate file '%s': %s", crtfile, strerror(errno)));
> +     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, strerror(errno), 0);
> +     goto done;
> +   }
> +
> +   if (!PEM_write_bio_X509(bio, cert))
> +   {
> ++    DEBUG_puts("1cupsMakeServerCredentials: PEM_write_bio_X509 failed."=
);
> +     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to write X.509 c=
ertificate."), 1);
> +     BIO_free(bio);
> +     goto done;
> +@@ -1082,10 +1086,10 @@ _httpTLSStart(http_t *http)            // I - Co=
nnection to server
> +
> +       if (!cupsMakeServerCredentials(tls_keypath, cn, 0, NULL, time(NUL=
L) + 3650 * 86400))
> +       {
> +-      DEBUG_puts("4_httpTLSStart: cupsMakeServerCredentials failed.");
> ++      DEBUG_printf(("4_httpTLSStart: cupsMakeServerCredentials failed: =
%s", cupsLastErrorString()));
> +       http->error  =3D errno =3D EINVAL;
> +       http->status =3D HTTP_STATUS_ERROR;
> +-      _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to create serv=
er credentials."), 1);
> ++//    _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to create serv=
er credentials."), 1);
> +       SSL_CTX_free(context);
> +         _cupsMutexUnlock(&tls_mutex);
> +
> +@@ -1346,14 +1350,17 @@ http_bio_read(BIO  *h,                 // I - BI=
O data
> +
> +   http =3D (http_t *)BIO_get_data(h);
> +
> +-  if (!http->blocking)
> ++  if (!http->blocking || http->timeout_value > 0.0)
> +   {
> +    /*
> +     * Make sure we have data before we read...
> +     */
> +
> +-    if (!_httpWait(http, 10000, 0))
> ++    while (!_httpWait(http, http->wait_value, 0))
> +     {
> ++      if (http->timeout_cb && (*http->timeout_cb)(http, http->timeout_d=
ata))
> ++      continue;
> ++
> + #ifdef WIN32
> +       http->error =3D WSAETIMEDOUT;
> + #else
> +diff --git a/scheduler/client.c b/scheduler/client.c
> +index 233f9017d..d495d9a75 100644
> +--- a/scheduler/client.c
> ++++ b/scheduler/client.c
> +@@ -34,11 +34,11 @@
> +
> + static int            check_if_modified(cupsd_client_t *con,
> +                                         struct stat *filestats);
> +-static int            compare_clients(cupsd_client_t *a, cupsd_client_t=
 *b,
> +-                                      void *data);
> + #ifdef HAVE_TLS
> +-static int            cupsd_start_tls(cupsd_client_t *con, http_encrypt=
ion_t e);
> ++static int            check_start_tls(cupsd_client_t *con);
> + #endif /* HAVE_TLS */
> ++static int            compare_clients(cupsd_client_t *a, cupsd_client_t=
 *b,
> ++                                      void *data);
> + static char           *get_file(cupsd_client_t *con, struct stat *files=
tats,
> +                                 char *filename, size_t len);
> + static http_status_t  install_cupsd_conf(cupsd_client_t *con);
> +@@ -360,14 +360,20 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Lis=
tener socket */
> +   if (lis->encryption =3D=3D HTTP_ENCRYPTION_ALWAYS)
> +   {
> +    /*
> +-    * https connection; go secure...
> ++    * HTTPS connection, force TLS negotiation...
> +     */
> +
> +-    if (cupsd_start_tls(con, HTTP_ENCRYPTION_ALWAYS))
> +-      cupsdCloseClient(con);
> ++    con->tls_start =3D time(NULL);
> ++    con->encryption =3D HTTP_ENCRYPTION_ALWAYS;
> +   }
> +   else
> ++  {
> ++   /*
> ++    * HTTP connection, but check for HTTPS negotiation on first data...
> ++    */
> ++
> +     con->auto_ssl =3D 1;
> ++  }
> + #endif /* HAVE_TLS */
> + }
> +
> +@@ -606,17 +612,46 @@ cupsdReadClient(cupsd_client_t *con)     /* I - Cl=
ient to read from */
> +
> +     con->auto_ssl =3D 0;
> +
> +-    if (recv(httpGetFd(con->http), buf, 1, MSG_PEEK) =3D=3D 1 &&
> +-        (!buf[0] || !strchr("DGHOPT", buf[0])))
> ++    if (recv(httpGetFd(con->http), buf, 5, MSG_PEEK) =3D=3D 5 && buf[0]=
 =3D=3D 0x16 && buf[1] =3D=3D 3 && buf[2])
> +     {
> +      /*
> +-      * Encrypt this connection...
> ++      * Client hello record, encrypt this connection...
> +       */
> +
> +-      cupsdLogClient(con, CUPSD_LOG_DEBUG2, "Saw first byte %02X, auto-=
negotiating SSL/TLS session.", buf[0] & 255);
> ++      cupsdLogClient(con, CUPSD_LOG_DEBUG2, "Saw client hello record, a=
uto-negotiating TLS session.");
> ++      con->tls_start =3D time(NULL);
> ++      con->encryption =3D HTTP_ENCRYPTION_ALWAYS;
> ++    }
> ++  }
> +
> +-      if (cupsd_start_tls(con, HTTP_ENCRYPTION_ALWAYS))
> +-        cupsdCloseClient(con);
> ++  if (con->tls_start)
> ++  {
> ++   /*
> ++    * Try negotiating TLS...
> ++    */
> ++
> ++    int tls_status =3D check_start_tls(con);
> ++
> ++    if (tls_status < 0)
> ++    {
> ++     /*
> ++      * TLS negotiation failed, close the connection.
> ++      */
> ++
> ++      cupsdCloseClient(con);
> ++      return;
> ++    }
> ++    else if (tls_status =3D=3D 0)
> ++    {
> ++     /*
> ++      * Nothing to do yet...
> ++      */
> ++
> ++      if ((time(NULL) - con->tls_start) > 5)
> ++      {
> ++      // Timeout, close the connection...
> ++      cupsdCloseClient(con);
> ++      }
> +
> +       return;
> +     }
> +@@ -780,9 +815,7 @@ cupsdReadClient(cupsd_client_t *con)       /* I - Cl=
ient to read from */
> +         * Parse incoming parameters until the status changes...
> +       */
> +
> +-        while ((status =3D httpUpdate(con->http)) =3D=3D HTTP_STATUS_CO=
NTINUE)
> +-        if (!httpGetReady(con->http))
> +-          break;
> ++      status =3D httpUpdate(con->http);
> +
> +       if (status !=3D HTTP_STATUS_OK && status !=3D HTTP_STATUS_CONTINU=
E)
> +       {
> +@@ -944,11 +977,10 @@ cupsdReadClient(cupsd_client_t *con)     /* I - Cl=
ient to read from */
> +         return;
> +       }
> +
> +-        if (cupsd_start_tls(con, HTTP_ENCRYPTION_REQUIRED))
> +-        {
> +-        cupsdCloseClient(con);
> +-        return;
> +-      }
> ++      con->tls_start =3D time(NULL);
> ++      con->tls_upgrade =3D 1;
> ++      con->encryption =3D HTTP_ENCRYPTION_REQUIRED;
> ++      return;
> + #else
> +       if (!cupsdSendError(con, HTTP_STATUS_NOT_IMPLEMENTED, CUPSD_AUTH_=
NONE))
> +       {
> +@@ -987,32 +1019,11 @@ cupsdReadClient(cupsd_client_t *con)    /* I - Cl=
ient to read from */
> +       if (!_cups_strcasecmp(httpGetField(con->http, HTTP_FIELD_CONNECTI=
ON),
> +                             "Upgrade") && !httpIsEncrypted(con->http))
> +       {
> +-#ifdef HAVE_TLS
> +-       /*
> +-        * Do encryption stuff...
> +-      */
> +-
> +-        httpClearFields(con->http);
> +-
> +-      if (!cupsdSendHeader(con, HTTP_STATUS_SWITCHING_PROTOCOLS, NULL,
> +-                           CUPSD_AUTH_NONE))
> +-      {
> +-        cupsdCloseClient(con);
> +-        return;
> +-      }
> +-
> +-        if (cupsd_start_tls(con, HTTP_ENCRYPTION_REQUIRED))
> +-        {
> +-        cupsdCloseClient(con);
> +-        return;
> +-      }
> +-#else
> +       if (!cupsdSendError(con, HTTP_STATUS_NOT_IMPLEMENTED, CUPSD_AUTH_=
NONE))
> +       {
> +         cupsdCloseClient(con);
> +         return;
> +       }
> +-#endif /* HAVE_TLS */
> +       }
> +
> +       if ((status =3D cupsdIsAuthorized(con, NULL)) !=3D HTTP_STATUS_OK=
)
> +@@ -2685,6 +2696,69 @@ check_if_modified(
> + }
> +
> +
> ++#ifdef HAVE_TLS
> ++/*
> ++ * 'check_start_tls()' - Start encryption on a connection.
> ++ */
> ++
> ++static int                            /* O - 0 to continue, 1 on succes=
s, -1 on error */
> ++check_start_tls(cupsd_client_t *con)  /* I - Client connection */
> ++{
> ++  unsigned char       chello[4096];           /* Client hello record */
> ++  ssize_t     chello_bytes;           /* Bytes read/peeked */
> ++  int         chello_len;             /* Length of record */
> ++
> ++
> ++ /*
> ++  * See if we have a good and complete client hello record...
> ++  */
> ++
> ++  if ((chello_bytes =3D recv(httpGetFd(con->http), (char *)chello, size=
of(chello), MSG_PEEK)) < 5)
> ++    return (0);                               /* Not enough bytes (yet)=
 */
> ++
> ++  if (chello[0] !=3D 0x016 || chello[1] !=3D 3 || chello[2] =3D=3D 0)
> ++    return (-1);                      /* Not a TLS Client Hello record =
*/
> ++
> ++  chello_len =3D (chello[3] << 8) | chello[4];
> ++
> ++  if ((chello_len + 5) > chello_bytes)
> ++    return (0);                               /* Not enough bytes yet *=
/
> ++
> ++ /*
> ++  * OK, we do, try negotiating...
> ++  */
> ++
> ++  con->tls_start =3D 0;
> ++
> ++  if (httpEncryption(con->http, con->encryption))
> ++  {
> ++    cupsdLogClient(con, CUPSD_LOG_ERROR, "Unable to encrypt connection:=
 %s", cupsLastErrorString());
> ++    return (-1);
> ++  }
> ++
> ++  cupsdLogClient(con, CUPSD_LOG_DEBUG, "Connection now encrypted.");
> ++
> ++  if (con->tls_upgrade)
> ++  {
> ++    // Respond to the original OPTIONS command...
> ++    con->tls_upgrade =3D 0;
> ++
> ++    httpClearFields(con->http);
> ++    httpClearCookie(con->http);
> ++    httpSetField(con->http, HTTP_FIELD_CONTENT_LENGTH, "0");
> ++
> ++    if (!cupsdSendHeader(con, HTTP_STATUS_OK, NULL, CUPSD_AUTH_NONE))
> ++    {
> ++      cupsdCloseClient(con);
> ++      return (-1);
> ++    }
> ++  }
> ++
> ++  return (1);
> ++}
> ++#endif /* HAVE_TLS */
> ++
> ++
> + /*
> +  * 'compare_clients()' - Compare two client connections.
> +  */
> +@@ -2705,28 +2779,6 @@ compare_clients(cupsd_client_t *a,      /* I - Fi=
rst client */
> + }
> +
> +
> +-#ifdef HAVE_TLS
> +-/*
> +- * 'cupsd_start_tls()' - Start encryption on a connection.
> +- */
> +-
> +-static int                            /* O - 0 on success, -1 on error =
*/
> +-cupsd_start_tls(cupsd_client_t    *con,       /* I - Client connection =
*/
> +-                http_encryption_t e)  /* I - Encryption mode */
> +-{
> +-  if (httpEncryption(con->http, e))
> +-  {
> +-    cupsdLogClient(con, CUPSD_LOG_ERROR, "Unable to encrypt connection:=
 %s",
> +-                   cupsLastErrorString());
> +-    return (-1);
> +-  }
> +-
> +-  cupsdLogClient(con, CUPSD_LOG_DEBUG, "Connection now encrypted.");
> +-  return (0);
> +-}
> +-#endif /* HAVE_TLS */
> +-
> +-
> + /*
> +  * 'get_file()' - Get a filename and state info.
> +  */
> +diff --git a/scheduler/client.h b/scheduler/client.h
> +index 9fe4e2ea6..2939ce997 100644
> +--- a/scheduler/client.h
> ++++ b/scheduler/client.h
> +@@ -53,6 +53,9 @@ struct cupsd_client_s
> +   cups_lang_t         *language;      /* Language to use */
> + #ifdef HAVE_TLS
> +   int                 auto_ssl;       /* Automatic test for SSL/TLS */
> ++  time_t              tls_start;      /* Do TLS negotiation? */
> ++  int                 tls_upgrade;    /* Doing TLS upgrade via OPTIONS?=
 */
> ++  http_encryption_t   encryption;     /* Type of TLS negotiation */
> + #endif /* HAVE_TLS */
> +   http_addr_t         clientaddr;     /* Client's server address */
> +   char                        clientname[256];/* Client's server name f=
or connection */
> +diff --git a/scheduler/select.c b/scheduler/select.c
> +index 2e64f2a7e..ac6205c51 100644
> +--- a/scheduler/select.c
> ++++ b/scheduler/select.c
> +@@ -408,6 +408,9 @@ cupsdDoSelect(long timeout)                /* I - Ti=
meout in seconds */
> +
> +   cupsd_in_select =3D 1;
> +
> ++  // Prevent 100% CPU by releasing control before the kevent call...
> ++  usleep(1);
> ++
> +   if (timeout >=3D 0 && timeout < 86400)
> +   {
> +     ktimeout.tv_sec  =3D timeout;
> +@@ -452,6 +455,9 @@ cupsdDoSelect(long timeout)                /* I - Ti=
meout in seconds */
> +     struct epoll_event        *event;         /* Current event */
> +
> +
> ++    // Prevent 100% CPU by releasing control before the epoll_wait call=
...
> ++    usleep(1);
> ++
> +     if (timeout >=3D 0 && timeout < 86400)
> +       nfds =3D epoll_wait(cupsd_epoll_fd, cupsd_epoll_events, MaxFDs,
> +                       timeout * 1000);
> +@@ -544,6 +550,9 @@ cupsdDoSelect(long timeout)                /* I - Ti=
meout in seconds */
> +     }
> +   }
> +
> ++  // Prevent 100% CPU by releasing control before the poll call...
> ++  usleep(1);
> ++
> +   if (timeout >=3D 0 && timeout < 86400)
> +     nfds =3D poll(cupsd_pollfds, (nfds_t)count, timeout * 1000);
> +   else
> +@@ -597,6 +606,9 @@ cupsdDoSelect(long timeout)                /* I - Ti=
meout in seconds */
> +   cupsd_current_input  =3D cupsd_global_input;
> +   cupsd_current_output =3D cupsd_global_output;
> +
> ++  // Prevent 100% CPU by releasing control before the select call...
> ++  usleep(1);
> ++
> +   if (timeout >=3D 0 && timeout < 86400)
> +   {
> +     stimeout.tv_sec  =3D timeout;
> +--
> +2.44.1
> --
> 2.35.6
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227483): https://lists.openembedded.org/g/openembedde=
d-core/message/227483
> Mute This Topic: https://lists.openembedded.org/mt/116713026/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


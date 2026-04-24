Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30E3FED3D6
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 14:35:29 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24239.1777041316070602795
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 07:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S+0TMCtx;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48374014a77so103219795e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777041314; x=1777646114; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZceLOxxI0wwanuRZzN/NIdnYniUROToqovkaiUsgfAc=;
        b=S+0TMCtxU8d5m6cluVvDRlr5T073IqwdEpMXUu9kRWOw/Ei2MzBRzc09fqRpBdBX5Q
         ReX1XNthSZ6TqEKlGWYg5mSINttH1MzCBiRfmxzDmLwGNerTqMNyMqiNEH6JcJkK83eL
         HOkr+2wW00pWKhX2nwzXpFiqPosW4zxwCCf2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777041314; x=1777646114;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZceLOxxI0wwanuRZzN/NIdnYniUROToqovkaiUsgfAc=;
        b=k9cyGupoe0+lt4lVADOEDpnd6U+u6AwcAszg+42TOQFsP5Y+qJGTNzMA8oOmvxirCz
         0nKWjD2eKkz3VNvxRBTE4ldlouX4WAnZpTG6vhlKHFm9fbhSc0q77q0hmIuayWxq2cRo
         aMHqi8cj2sc+zV75xceAEX5X7oXxiB4Q8nAt3fHy9myfZp8/qB2ol7s2wqMRvo7P5vvG
         CZ8Ifu4HlhLCxMuVQGWtfTJFqSwjzAnPsbj3Dj4Z7wX0GIAe1SV8DXD6qRs6rQJFGgrX
         iBNB/cmsBc+MuWx9XFenaExHtPxGFavW1+AgmICAJ/GN7cfLVkMp5HhLnpvyk8gZGqhC
         fENA==
X-Forwarded-Encrypted: i=1; AFNElJ/tpFTBsjQ7GAqij/UbkYrT0IAR9s/XqGsepvh1mbASiCCwCN9RNkkS6ZR+Eh5cVxZjGfxThaQV6ieQwYX3pjoqrA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/7MiZMNar4tDCUHQ9x0q0FkdRJbrxZ67un2tGWOO0wjZbOwAJ
	rkNZi2/OckwXKX9YbjpugBbG/Ml8ie1VhBpNYZdqiF4AR02UElT9Ize7PZTgBDMjm2Dr7+LpsNA
	2xMEE7alresyQ
X-Gm-Gg: AeBDietOhS4ggmXNzIm9rVUQyXqp183Qh9GYxR2EG1g8chiKGi+OYSKhxUGq07WgrhP
	IsEpklK3xJMRXZUDG0yCAUMKNMpy7vpdm5RHy2+dILMfRKmzSs1u6firhBYjv7tQVA6UUH/qzN0
	AiWhu7WCFFXQNrgfo4ZV/VuvNTFuyRrC7/Q/GfS01PrC/VWiFy3ZNWYLu2nhuIQMZDcrtuMHa/g
	vjtfRlImsHDX9KZKo0+0uNkAzMmhXrKB0tDd12liwyhvvMutjXhENg/teaZdSZyPdvgE+74cL15
	lb5bbuLdj4XxsOn03wUlSmNlBtdVNi07hc6I2QX0v40YS/9wQ8ueYse95s80XwPrWnne45cZ1Vm
	SjCuj0oSkU9aMKGPU2gAgwYDwwySMuBFX6zWgSOQ4klL3APOUPyIwT1aPreyNS1j1zxR43qQIcx
	ZkNt0AdiLcCWyHh21a2qb6ryJfs2koRUeFa5fAr5snhMZszL2F3PM42L2AhjeXrnlHnwL0WQN+j
	YQyV/fgdod+csiAZoY7KxNVaA==
X-Received: by 2002:a05:600d:10:b0:489:1b0c:8b43 with SMTP id 5b1f17b1804b1-4891b0c8c48mr268631965e9.1.1777041313761;
        Fri, 24 Apr 2026 07:35:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c318636sm392989575e9.7.2026.04.24.07.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 07:35:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 16:35:12 +0200
Message-Id: <DI1GKL3P1D8Z.1K2ULPZVECUUZ@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] curl: backport HTTP/2 and HTTP/3
 error propagation fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <mail2szahir@gmail.com>, <openembedded-core@lists.openembedded.org>,
 <zahir.basha@kpit.com>
X-Mailer: aerc 0.20.0
References: <20260410105939.924439-1-zahir.basha@partner.bmwgroup.com>
In-Reply-To: <20260410105939.924439-1-zahir.basha@partner.bmwgroup.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 14:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235865

On Fri Apr 10, 2026 at 12:59 PM CEST, aszh07 via lists.openembedded.org wro=
te:
> From: Zahir Hussain <zahir.basha@kpit.com>
>
> Backport upstream commits:
> https://github.com/curl/curl/commit/8dd81bd5db6d087c1d0f1b0332a5e8d0ad50d=
634
> https://github.com/curl/curl/commit/5c59f91427c6e14036070d4e1426360393458=
b25
>
> These fixes correct handling of transfer write errors in HTTP/2 and HTTP/=
3 (ngtcp2)
> during parallel transfers. In curl 8.7.1, write callback errors were not =
properly
> propagated, leading to incorrect exit codes and improper stream cancellat=
ion.
>
> Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> ---
>  ...-pass-CURLcode-errors-from-callbacks.patch |  333 ++++
>  .../lib-add-Curl_xfer_write_resp_hd.patch     | 1746 +++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |    2 +
>  3 files changed, 2081 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/http2-ngtcp2-pass-CURL=
code-errors-from-callbacks.patch
>  create mode 100644 meta/recipes-support/curl/curl/lib-add-Curl_xfer_writ=
e_resp_hd.patch
>
> diff --git a/meta/recipes-support/curl/curl/http2-ngtcp2-pass-CURLcode-er=
rors-from-callbacks.patch b/meta/recipes-support/curl/curl/http2-ngtcp2-pas=
s-CURLcode-errors-from-callbacks.patch
> new file mode 100644
> index 0000000000..814072d5af
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/http2-ngtcp2-pass-CURLcode-errors-fr=
om-callbacks.patch
> @@ -0,0 +1,333 @@
> +From 5c59f91427c6e14036070d4e1426360393458b25 Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Thu, 18 Apr 2024 23:24:34 +0200
> +Subject: [PATCH] http2 + ngtcp2: pass CURLcode errors from callbacks
> +
> +- errors returned by Curl_xfer_write_resp() and the header variant are
> +  not errors in the protocol. The result needs to be returned on the
> +  next recv() from the protocol filter.
> +
> +- make xfer write errors for response data cause the stream to be
> +  cancelled
> +
> +- added pytest test_02_14 and test_02_15 to verify that also for
> +  parallel processing
> +
> +Reported-by: Laramie Leavitt
> +Fixes #13411
> +Closes #13424
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/5c59f9142=
7c6e14036070d4e1426360393458b25]
> +Comment: Hunks are refreshed
> +
> +Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> +---
> + lib/http2.c                    | 64 +++++++++++++++++++++--------
> + lib/vquic/curl_ngtcp2.c        | 73 +++++++++++++++++++++++-----------
> + tests/http/test_02_download.py | 28 +++++++++++++
> + 3 files changed, 125 insertions(+), 40 deletions(-)
> +

Hello,

> +diff --git a/lib/http2.c b/lib/http2.c
> +index 1ee57a4320ac..50dd878bb02e 100644
> +--- a/lib/http2.c
> ++++ b/lib/http2.c
> +@@ -193,6 +193,7 @@ struct h2_stream_ctx {
> +
   ^
   Here, this patch is missing a space on empty context lines.

> +   int status_code; /* HTTP response status code */
> +   uint32_t error; /* stream error code */
> ++  CURLcode xfer_result; /* Result of writing out response */
> +   uint32_t local_window_size; /* the local recv window size */
> +   int32_t id; /* HTTP/2 protocol identifier for stream */
> +   BIT(resp_hds_complete); /* we have a complete, final response */
> +@@ -975,6 +976,41 @@ static int push_promise(struct Curl_cfilter *cf,
> +   return rv;
> + }
> +
   ^ Also here

Finally, those are quite big patches. How can we be sure they won't
break anything?

Regards,

> ++static void h2_xfer_write_resp_hd(struct Curl_cfilter *cf,
> ++                                  struct Curl_easy *data,
> ++                                  struct h2_stream_ctx *stream,
> ++                                  const char *buf, size_t blen, bool eo=
s)
> ++{
> ++
> ++  /* If we already encountered an error, skip further writes */
> ++  if(!stream->xfer_result) {
> ++    stream->xfer_result =3D Curl_xfer_write_resp_hd(data, buf, blen, eo=
s);
> ++    if(stream->xfer_result)
> ++      CURL_TRC_CF(data, cf, "[%d] error %d writing %zu bytes of headers=
",
> ++                  stream->id, stream->xfer_result, blen);
> ++  }
> ++}
> ++
> ++static void h2_xfer_write_resp(struct Curl_cfilter *cf,
> ++                               struct Curl_easy *data,
> ++                               struct h2_stream_ctx *stream,
> ++                               const char *buf, size_t blen, bool eos)
> ++{
> ++
> ++  /* If we already encountered an error, skip further writes */
> ++  if(!stream->xfer_result)
> ++    stream->xfer_result =3D Curl_xfer_write_resp(data, buf, blen, eos);
> ++  /* If the transfer write is errored, we do not want any more data */
> ++  if(stream->xfer_result) {
> ++    struct cf_h2_ctx *ctx =3D cf->ctx;
> ++    CURL_TRC_CF(data, cf, "[%d] error %d writing %zu bytes of data, "
> ++                "RST-ing stream",
> ++                stream->id, stream->xfer_result, blen);
> ++    nghttp2_submit_rst_stream(ctx->h2, 0, stream->id,
> ++                              NGHTTP2_ERR_CALLBACK_FAILURE);
> ++  }
> ++}
> ++
> + static CURLcode on_stream_frame(struct Curl_cfilter *cf,
> +                                 struct Curl_easy *data,
> +                                 const nghttp2_frame *frame)
> +@@ -955,7 +955,6 @@ static CURLcode on_stream_frame(struct C
> +   struct cf_h2_ctx *ctx =3D cf->ctx;
> +   struct h2_stream_ctx *stream =3D H2_STREAM_CTX(data);
> +   int32_t stream_id =3D frame->hd.stream_id;
> +-  CURLcode result;
> +   int rv;
> +
> +   if(!stream) {
> +@@ -1030,9 +1065,7 @@ static CURLcode on_stream_frame(struct Curl_cfilte=
r *cf,
> +       stream->status_code =3D -1;
> +     }
> +
> +-    result =3D Curl_xfer_write_resp_hd(data, STRCONST("\r\n"), stream->=
closed);
> +-    if(result)
> +-      return result;
> ++    h2_xfer_write_resp_hd(cf, data, stream, STRCONST("\r\n"), stream->c=
losed);
> +
> +     if(stream->status_code / 100 !=3D 1) {
> +       stream->resp_hds_complete =3D TRUE;
> +@@ -1251,7 +1284,6 @@ static int on_data_chunk_recv(nghttp2_session *ses=
sion, uint8_t flags,
> +   struct cf_h2_ctx *ctx =3D cf->ctx;
> +   struct h2_stream_ctx *stream;
> +   struct Curl_easy *data_s;
> +-  CURLcode result;
> +   (void)flags;
> +
> +   DEBUGASSERT(stream_id); /* should never be a zero stream ID here */
> +@@ -1247,9 +1246,7 @@ static int on_data_chunk_recv(nghttp2_se
> +   if(!stream)
> +     return NGHTTP2_ERR_CALLBACK_FAILURE;
> +
> +-  result =3D Curl_xfer_write_resp(data_s, (char *)mem, len, FALSE);
> +-  if(result && result !=3D CURLE_AGAIN)
> +-    return NGHTTP2_ERR_CALLBACK_FAILURE;
> ++  h2_xfer_write_resp(cf, data_s, stream, (char *)mem, len, FALSE);
> +
> +   nghttp2_session_consume(ctx->h2, stream_id, len);
> +   stream->nrcvd_data +=3D (curl_off_t)len;
> +@@ -1500,8 +1527,8 @@ static int on_header(nghttp2_session *session, con=
st nghttp2_frame *frame,
> +     if(!result)
> +       result =3D Curl_dyn_addn(&ctx->scratch, STRCONST(" \r\n"));
> +     if(!result)
> +-      result =3D Curl_xfer_write_resp_hd(data_s, Curl_dyn_ptr(&ctx->scr=
atch),
> +-                                       Curl_dyn_len(&ctx->scratch), FAL=
SE);
> ++      h2_xfer_write_resp_hd(cf, data_s, stream, Curl_dyn_ptr(&ctx->scra=
tch),
> ++                            Curl_dyn_len(&ctx->scratch), FALSE);
> +     if(result)
> +       return NGHTTP2_ERR_CALLBACK_FAILURE;
> +     /* if we receive data for another handle, wake that up */
> +@@ -1525,8 +1552,8 @@ static int on_header(nghttp2_session *session, con=
st nghttp2_frame *frame,
> +   if(!result)
> +     result =3D Curl_dyn_addn(&ctx->scratch, STRCONST("\r\n"));
> +   if(!result)
> +-    result =3D Curl_xfer_write_resp_hd(data_s, Curl_dyn_ptr(&ctx->scrat=
ch),
> +-                                     Curl_dyn_len(&ctx->scratch), FALSE=
);
> ++    h2_xfer_write_resp_hd(cf, data_s, stream, Curl_dyn_ptr(&ctx->scratc=
h),
> ++                          Curl_dyn_len(&ctx->scratch), FALSE);
> +   if(result)
> +     return NGHTTP2_ERR_CALLBACK_FAILURE;
> +   /* if we receive data for another handle, wake that up */
> +@@ -1831,7 +1858,12 @@ static ssize_t stream_recv(struct Curl_cfilter *c=
f, struct Curl_easy *data,
> +
> +   (void)buf;
> +   *err =3D CURLE_AGAIN;
> +-  if(stream->closed) {
> ++  if(stream->xfer_result) {
> ++    CURL_TRC_CF(data, cf, "[%d] xfer write failed", stream->id);
> ++    *err =3D stream->xfer_result;
> ++    nread =3D -1;
> ++  }
> ++  else if(stream->closed) {
> +     CURL_TRC_CF(data, cf, "[%d] returning CLOSE", stream->id);
> +     nread =3D http2_handle_stream_close(cf, data, stream, err);
> +   }
> +diff --git a/lib/vquic/curl_ngtcp2.c b/lib/vquic/curl_ngtcp2.c
> +index 50fe7af701ac..5171125f2fc4 100644
> +--- a/lib/vquic/curl_ngtcp2.c
> ++++ b/lib/vquic/curl_ngtcp2.c
> +@@ -153,6 +153,7 @@ struct h3_stream_ctx {
> +   uint64_t error3; /* HTTP/3 stream error code */
> +   curl_off_t upload_left; /* number of request bytes left to upload */
> +   int status_code; /* HTTP status code */
> ++  CURLcode xfer_result; /* result from xfer_resp_write(_hd) */
> +   bool resp_hds_complete; /* we have a complete, final response */
> +   bool closed; /* TRUE on stream close */
> +   bool reset;  /* TRUE on stream reset */
> +@@ -795,6 +796,41 @@ static int cb_h3_stream_close(nghttp3_conn *conn, i=
nt64_t sid,
> +   return 0;
> + }
> +
> ++static void h3_xfer_write_resp_hd(struct Curl_cfilter *cf,
> ++                                  struct Curl_easy *data,
> ++                                  struct h3_stream_ctx *stream,
> ++                                  const char *buf, size_t blen, bool eo=
s)
> ++{
> ++
> ++  /* If we already encountered an error, skip further writes */
> ++  if(!stream->xfer_result) {
> ++    stream->xfer_result =3D Curl_xfer_write_resp_hd(data, buf, blen, eo=
s);
> ++    if(stream->xfer_result)
> ++      CURL_TRC_CF(data, cf, "[%"CURL_PRId64"] error %d writing %zu "
> ++                  "bytes of headers", stream->id, stream->xfer_result, =
blen);
> ++  }
> ++}
> ++
> ++static void h3_xfer_write_resp(struct Curl_cfilter *cf,
> ++                               struct Curl_easy *data,
> ++                               struct h3_stream_ctx *stream,
> ++                               const char *buf, size_t blen, bool eos)
> ++{
> ++
> ++  /* If we already encountered an error, skip further writes */
> ++  if(!stream->xfer_result)
> ++    stream->xfer_result =3D Curl_xfer_write_resp(data, buf, blen, eos);
> ++  /* If the transfer write is errored, we do not want any more data */
> ++  if(stream->xfer_result) {
> ++    struct cf_ngtcp2_ctx *ctx =3D cf->ctx;
> ++    CURL_TRC_CF(data, cf, "[%"CURL_PRId64"] error %d writing %zu bytes =
"
> ++                "of data, cancelling stream",
> ++                stream->id, stream->xfer_result, blen);
> ++    nghttp3_conn_close_stream(ctx->h3conn, stream->id,
> ++                              NGHTTP3_H3_REQUEST_CANCELLED);
> ++  }
> ++}
> ++
> + static int cb_h3_recv_data(nghttp3_conn *conn, int64_t stream3_id,
> +                            const uint8_t *buf, size_t blen,
> +                            void *user_data, void *stream_user_data)
> +@@ -768,7 +769,6 @@ static int cb_h3_recv_data(nghttp3_conn
> +   struct cf_ngtcp2_ctx *ctx =3D cf->ctx;
> +   struct Curl_easy *data =3D stream_user_data;
> +   struct h3_stream_ctx *stream =3D H3_STREAM_CTX(data);
> +-  CURLcode result;
> +
> +   (void)conn;
> +   (void)stream3_id;
> +@@ -776,12 +776,7 @@ static int cb_h3_recv_data(nghttp3_conn
> +   if(!stream)
> +     return NGHTTP3_ERR_CALLBACK_FAILURE;
> +
> +-  result =3D Curl_xfer_write_resp(data, (char *)buf, blen, FALSE);
> +-  if(result) {
> +-    CURL_TRC_CF(data, cf, "[%" PRId64 "] DATA len=3D%zu, ERROR receivin=
g %d",
> +-                stream->id, blen, result);
> +-    return NGHTTP3_ERR_CALLBACK_FAILURE;
> +-  }
> ++  h3_xfer_write_resp(cf, data, stream, (char *)buf, blen, FALSE);
> +   if(blen) {
> +     CURL_TRC_CF(data, cf, "[%" PRId64 "] ACK %zu bytes of DATA",
> +                 stream->id, blen);
> +@@ -814,7 +809,6 @@ static int cb_h3_end_headers(nghttp3_con
> +   struct Curl_cfilter *cf =3D user_data;
> +   struct Curl_easy *data =3D stream_user_data;
> +   struct h3_stream_ctx *stream =3D H3_STREAM_CTX(data);
> +-  CURLcode result =3D CURLE_OK;
> +   (void)conn;
> +   (void)stream_id;
> +   (void)fin;
> +@@ -823,10 +817,7 @@ static int cb_h3_end_headers(nghttp3_con
> +   if(!stream)
> +     return 0;
> +   /* add a CRLF only if we've received some headers */
> +-  result =3D Curl_xfer_write_resp_hd(data, STRCONST("\r\n"), stream->cl=
osed);
> +-  if(result) {
> +-    return -1;
> +-  }
> ++  h3_xfer_write_resp_hd(cf, data, stream, STRCONST("\r\n"), stream->clo=
sed);
> +
> +   CURL_TRC_CF(data, cf, "[%" PRId64 "] end_headers, status=3D%d",
> +               stream_id, stream->status_code);
> +@@ -915,8 +937,8 @@ static int cb_h3_recv_header(nghttp3_conn *conn, int=
64_t sid,
> +     if(!result)
> +       result =3D Curl_dyn_addn(&ctx->scratch, STRCONST(" \r\n"));
> +     if(!result)
> +-      result =3D Curl_xfer_write_resp_hd(data, Curl_dyn_ptr(&ctx->scrat=
ch),
> +-                                       Curl_dyn_len(&ctx->scratch), FAL=
SE);
> ++      h3_xfer_write_resp_hd(cf, data, stream, Curl_dyn_ptr(&ctx->scratc=
h),
> ++                            Curl_dyn_len(&ctx->scratch), FALSE);
> +     CURL_TRC_CF(data, cf, "[%" CURL_PRId64 "] status: %s",
> +                 stream_id, Curl_dyn_ptr(&ctx->scratch));
> +     if(result) {
> +@@ -939,11 +961,8 @@ static int cb_h3_recv_header(nghttp3_conn *conn, in=
t64_t sid,
> +     if(!result)
> +       result =3D Curl_dyn_addn(&ctx->scratch, STRCONST("\r\n"));
> +     if(!result)
> +-      result =3D Curl_xfer_write_resp_hd(data, Curl_dyn_ptr(&ctx->scrat=
ch),
> +-                                       Curl_dyn_len(&ctx->scratch), FAL=
SE);
> +-    if(result) {
> +-      return -1;
> +-    }
> ++      h3_xfer_write_resp_hd(cf, data, stream, Curl_dyn_ptr(&ctx->scratc=
h),
> ++                            Curl_dyn_len(&ctx->scratch), FALSE);
> +   }
> +   return 0;
> + }
> +@@ -1128,7 +1147,13 @@ static ssize_t cf_ngtcp2_recv(struct Curl_cfilter=
 *cf, struct Curl_easy *data,
> +     goto out;
> +   }
> +
> +-  if(stream->closed) {
> ++  if(stream->xfer_result) {
> ++    CURL_TRC_CF(data, cf, "[%" CURL_PRId64 "] xfer write failed", strea=
m->id);
> ++    *err =3D stream->xfer_result;
> ++    nread =3D -1;
> ++    goto out;
> ++  }
> ++  else if(stream->closed) {
> +     nread =3D recv_closed_stream(cf, data, stream, err);
> +     goto out;
> +   }
> +diff --git a/tests/http/test_02_download.py b/tests/http/test_02_downloa=
d.py
> +index 95a30e114b27..74f2e1e20fec 100644
> +--- a/tests/http/test_02_download.py
> ++++ b/tests/http/test_02_download.py
> +@@ -257,6 +257,34 @@ def test_02_13_head_serial_h2c(self, env: Env,
> +         ])
> +         r.check_response(count=3Dcount, http_status=3D200)
> +
> ++    @pytest.mark.parametrize("proto", ['h2', 'h3'])
> ++    def test_02_14_not_found(self, env: Env, httpd, nghttpx, repeat, pr=
oto):
> ++        if proto =3D=3D 'h3' and not env.have_h3():
> ++            pytest.skip("h3 not supported")
> ++        if proto =3D=3D 'h3' and env.curl_uses_lib('msh3'):
> ++            pytest.skip("msh3 stalls here")
> ++        count =3D 10
> ++        urln =3D f'https://{env.authority_for(env.domain1, proto)}/not-=
found?[0-{count-1}]'
> ++        curl =3D CurlClient(env=3Denv)
> ++        r =3D curl.http_download(urls=3D[urln], alpn_proto=3Dproto, ext=
ra_args=3D[
> ++            '--parallel'
> ++        ])
> ++        r.check_stats(count=3Dcount, http_status=3D404, exitcode=3D0)
> ++
> ++    @pytest.mark.parametrize("proto", ['h2', 'h3'])
> ++    def test_02_15_fail_not_found(self, env: Env, httpd, nghttpx, repea=
t, proto):
> ++        if proto =3D=3D 'h3' and not env.have_h3():
> ++            pytest.skip("h3 not supported")
> ++        if proto =3D=3D 'h3' and env.curl_uses_lib('msh3'):
> ++            pytest.skip("msh3 stalls here")
> ++        count =3D 10
> ++        urln =3D f'https://{env.authority_for(env.domain1, proto)}/not-=
found?[0-{count-1}]'
> ++        curl =3D CurlClient(env=3Denv)
> ++        r =3D curl.http_download(urls=3D[urln], alpn_proto=3Dproto, ext=
ra_args=3D[
> ++            '--fail'
> ++        ])
> ++        r.check_stats(count=3Dcount, http_status=3D404, exitcode=3D22)
> ++
> +     @pytest.mark.skipif(condition=3DEnv().slow_network, reason=3D"not s=
uitable for slow network tests")
> +     @pytest.mark.skipif(condition=3DEnv().ci_run, reason=3D"not suitabl=
e for CI runs")
> +     def test_02_20_h2_small_frames(self, env: Env, httpd, repeat):
> +
> diff --git a/meta/recipes-support/curl/curl/lib-add-Curl_xfer_write_resp_=
hd.patch b/meta/recipes-support/curl/curl/lib-add-Curl_xfer_write_resp_hd.p=
atch
> new file mode 100644
> index 0000000000..1a9d5dab46
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/lib-add-Curl_xfer_write_resp_hd.patc=
h
> @@ -0,0 +1,1746 @@
> +From 8dd81bd5db6d087c1d0f1b0332a5e8d0ad50d634 Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Thu, 21 Mar 2024 12:15:59 +0100
> +Subject: [PATCH] lib: add Curl_xfer_write_resp_hd
> +
> +Add method in protocol handlers to allow writing of a single,
> +0-terminated header line. Avoids parsing and copying these lines.
> +
> +Closes #13165
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/8dd81bd5d=
b6d087c1d0f1b0332a5e8d0ad50d634]
> +Comment: Few hunks are refreshed
> +
> +Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> +---
> + lib/c-hyper.c           |   2 +-
> + lib/curl_rtmp.c         |   6 +
> + lib/dict.c              |   1 +
> + lib/file.c              |   1 +
> + lib/ftp.c               |   2 +
> + lib/gopher.c            |   2 +
> + lib/http.c              | 661 ++++++++++++++++++++--------------------
> + lib/http.h              |   7 +-
> + lib/http2.c             |  52 ++--
> + lib/imap.c              |   2 +
> + lib/ldap.c              |   2 +
> + lib/mqtt.c              |   1 +
> + lib/openldap.c          |   2 +
> + lib/pop3.c              |   4 +-
> + lib/pop3.h              |   3 +-
> + lib/request.c           |   2 +-
> + lib/rtsp.c              |  17 +-
> + lib/rtsp.h              |   2 +-
> + lib/smb.c               |   2 +
> + lib/smtp.c              |   2 +
> + lib/telnet.c            |   1 +
> + lib/tftp.c              |   1 +
> + lib/transfer.c          |  14 +-
> + lib/transfer.h          |  12 +-
> + lib/urldata.h           |   8 +-
> + lib/vquic/curl_ngtcp2.c |  56 ++--
> + lib/vssh/libssh.c       |   2 +
> + lib/vssh/libssh2.c      |   2 +
> + lib/vssh/wolfssh.c      |   2 +
> + lib/ws.c                |   2 +
> + 30 files changed, 471 insertions(+), 402 deletions(-)
> +
> +diff --git a/lib/c-hyper.c b/lib/c-hyper.c
> +index 88674ee0a1ef..0593d9706586 100644
> +--- a/lib/c-hyper.c
> ++++ b/lib/c-hyper.c
> +@@ -171,7 +171,7 @@ static int hyper_each_header(void *userdata,
> +   len =3D Curl_dyn_len(&data->state.headerb);
> +   headp =3D Curl_dyn_ptr(&data->state.headerb);
> +
> +-  result =3D Curl_http_header(data, data->conn, headp, len);
> ++  result =3D Curl_http_header(data, headp, len);
> +   if(result) {
> +     data->state.hresult =3D result;
> +     return HYPER_ITER_BREAK;
> +diff --git a/lib/curl_rtmp.c b/lib/curl_rtmp.c
> +index b2f2adad8b19..c1fd981b7869 100644
> +--- a/lib/curl_rtmp.c
> ++++ b/lib/curl_rtmp.c
> +@@ -80,6 +80,7 @@ const struct Curl_handler Curl_handler_rtmp =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   rtmp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_RTMP,                            /* defport */
> +@@ -103,6 +104,7 @@ const struct Curl_handler Curl_handler_rtmpt =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   rtmp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_RTMPT,                           /* defport */
> +@@ -126,6 +128,7 @@ const struct Curl_handler Curl_handler_rtmpe =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   rtmp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_RTMP,                            /* defport */
> +@@ -149,6 +152,7 @@ const struct Curl_handler Curl_handler_rtmpte =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   rtmp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_RTMPT,                           /* defport */
> +@@ -172,6 +176,7 @@ const struct Curl_handler Curl_handler_rtmps =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   rtmp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_RTMPS,                           /* defport */
> +@@ -195,6 +200,7 @@ const struct Curl_handler Curl_handler_rtmpts =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   rtmp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_RTMPS,                           /* defport */
> +diff --git a/lib/dict.c b/lib/dict.c
> +index f37767882e7c..5404671c646d 100644
> +--- a/lib/dict.c
> ++++ b/lib/dict.c
> +@@ -90,6 +90,7 @@ const struct Curl_handler Curl_handler_dict =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ZERO_NULL,                            /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_DICT,                            /* defport */
> +diff --git a/lib/file.c b/lib/file.c
> +index bee9e92ecaa5..c436aaaad47d 100644
> +--- a/lib/file.c
> ++++ b/lib/file.c
> +@@ -115,6 +115,7 @@ const struct Curl_handler Curl_handler_file =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   file_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   0,                                    /* defport */
> +diff --git a/lib/ftp.c b/lib/ftp.c
> +index 5bbdeb054040..760b54ff3bc6 100644
> +--- a/lib/ftp.c
> ++++ b/lib/ftp.c
> +@@ -177,6 +177,7 @@ const struct Curl_handler Curl_handler_ftp =3D {
> +   ZERO_NULL,                       /* perform_getsock */
> +   ftp_disconnect,                  /* disconnect */
> +   ZERO_NULL,                       /* write_resp */
> ++  ZERO_NULL,                       /* write_resp_hd */
> +   ZERO_NULL,                       /* connection_check */
> +   ZERO_NULL,                       /* attach connection */
> +   PORT_FTP,                        /* defport */
> +@@ -208,6 +209,7 @@ const struct Curl_handler Curl_handler_ftps =3D {
> +   ZERO_NULL,                       /* perform_getsock */
> +   ftp_disconnect,                  /* disconnect */
> +   ZERO_NULL,                       /* write_resp */
> ++  ZERO_NULL,                       /* write_resp_hd */
> +   ZERO_NULL,                       /* connection_check */
> +   ZERO_NULL,                       /* attach connection */
> +   PORT_FTPS,                       /* defport */
> +diff --git a/lib/gopher.c b/lib/gopher.c
> +index e1a1ba648862..7ba070a769b3 100644
> +--- a/lib/gopher.c
> ++++ b/lib/gopher.c
> +@@ -76,6 +76,7 @@ const struct Curl_handler Curl_handler_gopher =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ZERO_NULL,                            /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_GOPHER,                          /* defport */
> +@@ -100,6 +101,7 @@ const struct Curl_handler Curl_handler_gophers =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ZERO_NULL,                            /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_GOPHER,                          /* defport */
> +diff --git a/lib/http.c b/lib/http.c
> +index 7cb8b63f8c17..dea166c3dddd 100644
> +--- a/lib/http.c
> ++++ b/lib/http.c
> +@@ -100,7 +100,7 @@
> +  * Forward declarations.
> +  */
> +
> +-static bool http_should_fail(struct Curl_easy *data);
> ++static bool http_should_fail(struct Curl_easy *data, int httpcode);
> + static bool http_exp100_is_waiting(struct Curl_easy *data);
> + static CURLcode http_exp100_add_reader(struct Curl_easy *data);
> + static void http_exp100_send_anyway(struct Curl_easy *data);
> +@@ -123,6 +123,7 @@ const struct Curl_handler Curl_handler_http =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ZERO_NULL,                            /* disconnect */
> +   Curl_http_write_resp,                 /* write_resp */
> ++  Curl_http_write_resp_hd,              /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_HTTP,                            /* defport */
> +@@ -151,6 +152,7 @@ const struct Curl_handler Curl_handler_https =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ZERO_NULL,                            /* disconnect */
> +   Curl_http_write_resp,                 /* write_resp */
> ++  Curl_http_write_resp_hd,              /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_HTTPS,                           /* defport */
> +@@ -243,8 +245,6 @@ char *Curl_copy_header_value(const char *header)
> +   while(*start && ISSPACE(*start))
> +     start++;
> +
> +-  /* data is in the host encoding so
> +-     use '\r' and '\n' instead of 0x0d and 0x0a */
> +   end =3D strchr(start, '\r');
> +   if(!end)
> +     end =3D strchr(start, '\n');
> +@@ -565,7 +565,7 @@ CURLcode Curl_http_auth_act(struct Curl_easy *data)
> +       data->state.authhost.done =3D TRUE;
> +     }
> +   }
> +-  if(http_should_fail(data)) {
> ++  if(http_should_fail(data, data->req.httpcode)) {
> +     failf(data, "The requested URL returned error: %d",
> +           data->req.httpcode);
> +     result =3D CURLE_HTTP_RETURNED_ERROR;
> +@@ -1006,21 +1006,18 @@ CURLcode Curl_http_input_auth(struct Curl_easy *=
data, bool proxy,
> + }
> +
> + /**
> +- * http_should_fail() determines whether an HTTP response has gotten us
> ++ * http_should_fail() determines whether an HTTP response code has gott=
en us
> +  * into an error state or not.
> +  *
> +  * @retval FALSE communications should continue
> +  *
> +  * @retval TRUE communications should not continue
> +  */
> +-static bool http_should_fail(struct Curl_easy *data)
> ++static bool http_should_fail(struct Curl_easy *data, int httpcode)
> + {
> +-  int httpcode;
> +   DEBUGASSERT(data);
> +   DEBUGASSERT(data->conn);
> +
> +-  httpcode =3D data->req.httpcode;
> +-
> +   /*
> +   ** If we haven't been asked to fail on error,
> +   ** don't fail.
> +@@ -2836,9 +2833,10 @@ checkprotoprefix(struct Curl_easy *data, struct c=
onnectdata *conn,
> + /*
> +  * Curl_http_header() parses a single response header.
> +  */
> +-CURLcode Curl_http_header(struct Curl_easy *data, struct connectdata *c=
onn,
> +-                          char *hd, size_t hdlen)
> ++CURLcode Curl_http_header(struct Curl_easy *data,
> ++                          const char *hd, size_t hdlen)
> + {
> ++  struct connectdata *conn =3D data->conn;
> +   CURLcode result;
> +   struct SingleRequest *k =3D &data->req;
> +   const char *v;
> +@@ -2848,7 +2846,7 @@ CURLcode Curl_http_header(struct Curl_easy *data, =
struct connectdata *conn,
> +   case 'A':
> + #ifndef CURL_DISABLE_ALTSVC
> +     v =3D (data->asi &&
> +-         ((conn->handler->flags & PROTOPT_SSL) ||
> ++         ((data->conn->handler->flags & PROTOPT_SSL) ||
> + #ifdef CURLDEBUG
> +           /* allow debug builds to circumvent the HTTPS restriction */
> +           getenv("CURL_ALTSVC_HTTP")
> +@@ -3306,12 +3304,11 @@ CURLcode Curl_http_size(struct Curl_easy *data)
> +   return CURLE_OK;
> + }
> +
> +-static CURLcode verify_header(struct Curl_easy *data)
> ++static CURLcode verify_header(struct Curl_easy *data,
> ++                              const char *hd, size_t hdlen)
> + {
> +   struct SingleRequest *k =3D &data->req;
> +-  const char *header =3D Curl_dyn_ptr(&data->state.headerb);
> +-  size_t hlen =3D Curl_dyn_len(&data->state.headerb);
> +-  char *ptr =3D memchr(header, 0x00, hlen);
> ++  char *ptr =3D memchr(hd, 0x00, hdlen);
> +   if(ptr) {
> +     /* this is bad, bail out */
> +     failf(data, "Nul byte in header");
> +@@ -3320,11 +3317,11 @@ static CURLcode verify_header(struct Curl_easy *=
data)
> +   if(k->headerline < 2)
> +     /* the first "header" is the status-line and it has no colon */
> +     return CURLE_OK;
> +-  if(((header[0] =3D=3D ' ') || (header[0] =3D=3D '\t')) && k->headerli=
ne > 2)
> ++  if(((hd[0] =3D=3D ' ') || (hd[0] =3D=3D '\t')) && k->headerline > 2)
> +     /* line folding, can't happen on line 2 */
> +     ;
> +   else {
> +-    ptr =3D memchr(header, ':', hlen);
> ++    ptr =3D memchr(hd, ':', hdlen);
> +     if(!ptr) {
> +       /* this is bad, bail out */
> +       failf(data, "Header without colon");
> +@@ -3369,7 +3366,6 @@ static CURLcode http_on_response(struct Curl_easy =
*data,
> +   struct connectdata *conn =3D data->conn;
> +   CURLcode result =3D CURLE_OK;
> +   struct SingleRequest *k =3D &data->req;
> +-  bool switch_to_h2 =3D FALSE;
> +
> +   (void)buf; /* not used without HTTP2 enabled */
> +   *pconsumed =3D 0;
> +@@ -3388,96 +3384,92 @@ static CURLcode http_on_response(struct Curl_eas=
y *data,
> +     return CURLE_UNSUPPORTED_PROTOCOL;
> +   }
> +   else if(k->httpcode < 200) {
> +-    /* "A user agent MAY ignore unexpected 1xx status responses." */
> ++    /* "A user agent MAY ignore unexpected 1xx status responses."
> ++     * By default, we expect to get more responses after this one. */
> ++    k->header =3D TRUE;
> ++    k->headerline =3D 0; /* restart the header line counter */
> ++
> +     switch(k->httpcode) {
> +     case 100:
> +       /*
> +        * We have made an HTTP PUT or POST and this is 1.1-lingo
> +        * that tells us that the server is OK with this and ready
> +        * to receive the data.
> +-       * However, we'll get more headers now so we must get
> +-       * back into the header-parsing state!
> +        */
> +-      k->header =3D TRUE;
> +-      k->headerline =3D 0; /* restart the header line counter */
> +-
> +-      /* if we did wait for this do enable write now! */
> +       Curl_http_exp100_got100(data);
> +       break;
> +     case 101:
> +-      if(conn->httpversion =3D=3D 11) {
> +-        /* Switching Protocols only allowed from HTTP/1.1 */
> +-        if(k->upgr101 =3D=3D UPGR101_H2) {
> +-          /* Switching to HTTP/2 */
> +-          infof(data, "Received 101, Switching to HTTP/2");
> +-          k->upgr101 =3D UPGR101_RECEIVED;
> +-
> +-          /* we'll get more headers (HTTP/2 response) */
> +-          k->header =3D TRUE;
> +-          k->headerline =3D 0; /* restart the header line counter */
> +-          switch_to_h2 =3D TRUE;
> +-        }
> +-#ifdef USE_WEBSOCKETS
> +-        else if(k->upgr101 =3D=3D UPGR101_WS) {
> +-          /* verify the response */
> +-          result =3D Curl_ws_accept(data, buf, blen);
> +-          if(result)
> +-            return result;
> +-          k->header =3D FALSE; /* no more header to parse! */
> +-          *pconsumed +=3D blen; /* ws accept handled the data */
> +-          blen =3D 0;
> +-          if(data->set.connect_only)
> +-            k->keepon &=3D ~KEEP_RECV; /* read no more content */
> +-        }
> +-#endif
> +-        else {
> +-          /* Not switching to another protocol */
> +-          k->header =3D FALSE; /* no more header to parse! */
> +-        }
> +-      }
> +-      else {
> ++      /* Switching Protocols only allowed from HTTP/1.1 */
> ++      if(conn->httpversion !=3D 11) {
> +         /* invalid for other HTTP versions */
> +         failf(data, "unexpected 101 response code");
> +         return CURLE_WEIRD_SERVER_REPLY;
> +       }
> ++      if(k->upgr101 =3D=3D UPGR101_H2) {
> ++        /* Switching to HTTP/2, where we will get more responses */
> ++        infof(data, "Received 101, Switching to HTTP/2");
> ++        k->upgr101 =3D UPGR101_RECEIVED;
> ++        /* We expect more response from HTTP/2 later */
> ++        k->header =3D TRUE;
> ++        k->headerline =3D 0; /* restart the header line counter */
> ++        /* Any remaining `buf` bytes are already HTTP/2 and passed to
> ++         * be processed. */
> ++        result =3D Curl_http2_upgrade(data, conn, FIRSTSOCKET, buf, ble=
n);
> ++        if(result)
> ++          return result;
> ++        *pconsumed +=3D blen;
> ++      }
> ++#ifdef USE_WEBSOCKETS
> ++      else if(k->upgr101 =3D=3D UPGR101_WS) {
> ++        /* verify the response. Any passed `buf` bytes are already in
> ++         * WebSockets format and taken in by the protocol handler. */
> ++        result =3D Curl_ws_accept(data, buf, blen);
> ++        if(result)
> ++          return result;
> ++        *pconsumed +=3D blen; /* ws accept handled the data */
> ++        k->header =3D FALSE; /* we will not get more responses */
> ++        if(data->set.connect_only)
> ++          k->keepon &=3D ~KEEP_RECV; /* read no more content */
> ++      }
> ++#endif
> ++      else {
> ++        /* We silently accept this as the final response.
> ++         * TODO: this looks, uhm, wrong. What are we switching to if we
> ++         * did not ask for an Upgrade? Maybe the application provided a=
n
> ++         * `Upgrade: xxx` header? */
> ++        k->header =3D FALSE;
> ++      }
> +       break;
> +     default:
> +-      /* the status code 1xx indicates a provisional response, so
> +-         we'll get another set of headers */
> +-      k->header =3D TRUE;
> +-      k->headerline =3D 0; /* restart the header line counter */
> ++      /* The server may send us other 1xx responses, like informative
> ++       * 103. This have no influence on request processing and we expec=
t
> ++       * to receive a final response eventually. */
> +       break;
> +     }
> ++    return result;
> +   }
> +-  else {
> +-    /* k->httpcode >=3D 200, final response */
> +-    k->header =3D FALSE;
> +
> +-    if(k->upgr101 =3D=3D UPGR101_H2) {
> +-      /* A requested upgrade was denied, poke the multi handle to possi=
bly
> +-         allow a pending pipewait to continue */
> +-      Curl_multi_connchanged(data->multi);
> +-    }
> ++  /* k->httpcode >=3D 200, final response */
> ++  k->header =3D FALSE;
> +
> +-    if((k->size =3D=3D -1) && !k->chunk && !conn->bits.close &&
> +-       (conn->httpversion =3D=3D 11) &&
> +-       !(conn->handler->protocol & CURLPROTO_RTSP) &&
> +-       data->state.httpreq !=3D HTTPREQ_HEAD) {
> +-      /* On HTTP 1.1, when connection is not to get closed, but no
> +-         Content-Length nor Transfer-Encoding chunked have been
> +-         received, according to RFC2616 section 4.4 point 5, we
> +-         assume that the server will close the connection to
> +-         signal the end of the document. */
> +-      infof(data, "no chunk, no close, no size. Assume close to "
> +-            "signal end");
> +-      streamclose(conn, "HTTP: No end-of-message indicator");
> +-    }
> ++  if(k->upgr101 =3D=3D UPGR101_H2) {
> ++    /* A requested upgrade was denied, poke the multi handle to possibl=
y
> ++       allow a pending pipewait to continue */
> ++    Curl_multi_connchanged(data->multi);
> +   }
> +
> +-  if(!k->header) {
> +-    result =3D Curl_http_size(data);
> +-    if(result)
> +-      return result;
> ++  if((k->size =3D=3D -1) && !k->chunk && !conn->bits.close &&
> ++     (conn->httpversion =3D=3D 11) &&
> ++     !(conn->handler->protocol & CURLPROTO_RTSP) &&
> ++     data->state.httpreq !=3D HTTPREQ_HEAD) {
> ++    /* On HTTP 1.1, when connection is not to get closed, but no
> ++       Content-Length nor Transfer-Encoding chunked have been
> ++       received, according to RFC2616 section 4.4 point 5, we
> ++       assume that the server will close the connection to
> ++       signal the end of the document. */
> ++    infof(data, "no chunk, no close, no size. Assume close to "
> ++          "signal end");
> ++    streamclose(conn, "HTTP: No end-of-message indicator");
> +   }
> +
> +   /* At this point we have some idea about the fate of the connection.
> +@@ -3511,31 +3503,25 @@ static CURLcode http_on_response(struct Curl_eas=
y *data,
> +   }
> + #endif
> +
> +-  /*
> +-   * When all the headers have been parsed, see if we should give
> +-   * up and return an error.
> +-   */
> +-  if(http_should_fail(data)) {
> +-    failf(data, "The requested URL returned error: %d",
> +-          k->httpcode);
> +-    return CURLE_HTTP_RETURNED_ERROR;
> +-  }
> +-
> + #ifdef USE_WEBSOCKETS
> +-  /* All non-101 HTTP status codes are bad when wanting to upgrade to
> +-     websockets */
> ++  /* All >=3D200 HTTP status codes are errors when wanting websockets *=
/
> +   if(data->req.upgr101 =3D=3D UPGR101_WS) {
> +     failf(data, "Refused WebSockets upgrade: %d", k->httpcode);
> +     return CURLE_HTTP_RETURNED_ERROR;
> +   }
> + #endif
> +
> ++  /* Check if this response means the transfer errored. */
> ++  if(http_should_fail(data, data->req.httpcode)) {
> ++    failf(data, "The requested URL returned error: %d",
> ++          k->httpcode);
> ++    return CURLE_HTTP_RETURNED_ERROR;
> ++  }
> +
> +   /* Curl_http_auth_act() checks what authentication methods
> +    * that are available and decides which one (if any) to
> +    * use. It will set 'newurl' if an auth method was picked. */
> +   result =3D Curl_http_auth_act(data);
> +-
> +   if(result)
> +     return result;
> +
> +@@ -3606,65 +3592,244 @@ static CURLcode http_on_response(struct Curl_ea=
sy *data,
> +       infof(data, "Keep sending data to get tossed away");
> +       k->keepon |=3D KEEP_SEND;
> +     }
> ++
> +   }
> +
> +-  if(!k->header) {
> +-    /*
> +-     * really end-of-headers.
> +-     *
> +-     * If we requested a "no body", this is a good time to get
> +-     * out and return home.
> ++  /* This is the last response that we will got for the current request=
.
> ++   * Check on the body size and determine if the response is complete.
> ++   */
> ++  result =3D Curl_http_size(data);
> ++  if(result)
> ++    return result;
> ++
> ++  /* If we requested a "no body", this is a good time to get
> ++   * out and return home.
> ++   */
> ++  if(data->req.no_body)
> ++    k->download_done =3D TRUE;
> ++
> ++  /* If max download size is *zero* (nothing) we already have
> ++     nothing and can safely return ok now!  But for HTTP/2, we'd
> ++     like to call http2_handle_stream_close to properly close a
> ++     stream.  In order to do this, we keep reading until we
> ++     close the stream. */
> ++  if(0 =3D=3D k->maxdownload
> ++     && !Curl_conn_is_http2(data, conn, FIRSTSOCKET)
> ++     && !Curl_conn_is_http3(data, conn, FIRSTSOCKET))
> ++    k->download_done =3D TRUE;
> ++
> ++  /* final response without error, prepare to receive the body */
> ++  return Curl_http_firstwrite(data);
> ++}
> ++
> ++static CURLcode http_rw_hd(struct Curl_easy *data,
> ++                           const char *hd, size_t hdlen,
> ++                           const char *buf_remain, size_t blen,
> ++                           size_t *pconsumed)
> ++{
> ++  CURLcode result =3D CURLE_OK;
> ++  struct SingleRequest *k =3D &data->req;
> ++  int writetype;
> ++
> ++  *pconsumed =3D 0;
> ++  if((0x0a =3D=3D *hd) || (0x0d =3D=3D *hd)) {
> ++    /* Empty header line means end of headers! */
> ++    size_t consumed;
> ++
> ++    /* now, only output this if the header AND body are requested:
> +      */
> +-    if(data->req.no_body)
> +-      k->download_done =3D TRUE;
> +-
> +-    /* If max download size is *zero* (nothing) we already have
> +-       nothing and can safely return ok now!  But for HTTP/2, we'd
> +-       like to call http2_handle_stream_close to properly close a
> +-       stream.  In order to do this, we keep reading until we
> +-       close the stream. */
> +-    if(0 =3D=3D k->maxdownload
> +-       && !Curl_conn_is_http2(data, conn, FIRSTSOCKET)
> +-       && !Curl_conn_is_http3(data, conn, FIRSTSOCKET))
> +-      k->download_done =3D TRUE;
> +-  }
> +-
> +-  if(switch_to_h2) {
> +-    /* Having handled the headers, we can do the HTTP/2 switch.
> +-     * Any remaining `buf` bytes are already HTTP/2 and passed to
> +-     * be processed. */
> +-    result =3D Curl_http2_upgrade(data, conn, FIRSTSOCKET, buf, blen);
> ++    Curl_debug(data, CURLINFO_HEADER_IN, (char *)hd, hdlen);
> ++
> ++    writetype =3D CLIENTWRITE_HEADER |
> ++      ((k->httpcode/100 =3D=3D 1) ? CLIENTWRITE_1XX : 0);
> ++
> ++    result =3D Curl_client_write(data, writetype, hd, hdlen);
> ++    if(result)
> ++      return result;
> ++
> ++    result =3D Curl_bump_headersize(data, hdlen, FALSE);
> ++    if(result)
> ++      return result;
> ++
> ++    data->req.deductheadercount =3D
> ++      (100 <=3D k->httpcode && 199 >=3D k->httpcode)?data->req.headerby=
tecount:0;
> ++
> ++    /* analyze the response to find out what to do. */
> ++    /* Caveat: we clear anything in the header brigade, because a
> ++     * response might switch HTTP version which may call use recursivel=
y.
> ++     * Not nice, but that is currently the way of things. */
> ++    Curl_dyn_reset(&data->state.headerb);
> ++    result =3D http_on_response(data, buf_remain, blen, &consumed);
> +     if(result)
> +       return result;
> +-    *pconsumed +=3D blen;
> ++    *pconsumed +=3D consumed;
> ++    return CURLE_OK;
> +   }
> +
> ++  /*
> ++   * Checks for special headers coming up.
> ++   */
> ++
> ++  writetype =3D CLIENTWRITE_HEADER;
> ++  if(!k->headerline++) {
> ++    /* This is the first header, it MUST be the error code line
> ++       or else we consider this to be the body right away! */
> ++    bool fine_statusline =3D FALSE;
> ++
> ++    k->httpversion =3D 0; /* Don't know yet */
> ++    if(data->conn->handler->protocol & PROTO_FAMILY_HTTP) {
> ++      /*
> ++       * https://datatracker.ietf.org/doc/html/rfc7230#section-3.1.2
> ++       *
> ++       * The response code is always a three-digit number in HTTP as th=
e spec
> ++       * says. We allow any three-digit number here, but we cannot make
> ++       * guarantees on future behaviors since it isn't within the proto=
col.
> ++       */
> ++      const char *p =3D hd;
> ++
> ++      while(*p && ISBLANK(*p))
> ++        p++;
> ++      if(!strncmp(p, "HTTP/", 5)) {
> ++        p +=3D 5;
> ++        switch(*p) {
> ++        case '1':
> ++          p++;
> ++          if((p[0] =3D=3D '.') && (p[1] =3D=3D '0' || p[1] =3D=3D '1'))=
 {
> ++            if(ISBLANK(p[2])) {
> ++              k->httpversion =3D 10 + (p[1] - '0');
> ++              p +=3D 3;
> ++              if(ISDIGIT(p[0]) && ISDIGIT(p[1]) && ISDIGIT(p[2])) {
> ++                k->httpcode =3D (p[0] - '0') * 100 + (p[1] - '0') * 10 =
+
> ++                  (p[2] - '0');
> ++                p +=3D 3;
> ++                if(ISSPACE(*p))
> ++                  fine_statusline =3D TRUE;
> ++              }
> ++            }
> ++          }
> ++          if(!fine_statusline) {
> ++            failf(data, "Unsupported HTTP/1 subversion in response");
> ++            return CURLE_UNSUPPORTED_PROTOCOL;
> ++          }
> ++          break;
> ++        case '2':
> ++        case '3':
> ++          if(!ISBLANK(p[1]))
> ++            break;
> ++          k->httpversion =3D (*p - '0') * 10;
> ++          p +=3D 2;
> ++          if(ISDIGIT(p[0]) && ISDIGIT(p[1]) && ISDIGIT(p[2])) {
> ++            k->httpcode =3D (p[0] - '0') * 100 + (p[1] - '0') * 10 +
> ++              (p[2] - '0');
> ++            p +=3D 3;
> ++            if(!ISSPACE(*p))
> ++              break;
> ++            fine_statusline =3D TRUE;
> ++          }
> ++          break;
> ++        default: /* unsupported */
> ++          failf(data, "Unsupported HTTP version in response");
> ++          return CURLE_UNSUPPORTED_PROTOCOL;
> ++        }
> ++      }
> ++
> ++      if(!fine_statusline) {
> ++        /* If user has set option HTTP200ALIASES,
> ++           compare header line against list of aliases
> ++        */
> ++        statusline check =3D checkhttpprefix(data, hd, hdlen);
> ++        if(check =3D=3D STATUS_DONE) {
> ++          fine_statusline =3D TRUE;
> ++          k->httpcode =3D 200;
> ++          k->httpversion =3D 10;
> ++        }
> ++      }
> ++    }
> ++    else if(data->conn->handler->protocol & CURLPROTO_RTSP) {
> ++      const char *p =3D hd;
> ++      while(*p && ISBLANK(*p))
> ++        p++;
> ++      if(!strncmp(p, "RTSP/", 5)) {
> ++        p +=3D 5;
> ++        if(ISDIGIT(*p)) {
> ++          p++;
> ++          if((p[0] =3D=3D '.') && ISDIGIT(p[1])) {
> ++            if(ISBLANK(p[2])) {
> ++              p +=3D 3;
> ++              if(ISDIGIT(p[0]) && ISDIGIT(p[1]) && ISDIGIT(p[2])) {
> ++                k->httpcode =3D (p[0] - '0') * 100 + (p[1] - '0') * 10 =
+
> ++                  (p[2] - '0');
> ++                p +=3D 3;
> ++                if(ISSPACE(*p)) {
> ++                  fine_statusline =3D TRUE;
> ++                  k->httpversion =3D 11; /* RTSP acts like HTTP 1.1 */
> ++                }
> ++              }
> ++            }
> ++          }
> ++        }
> ++        if(!fine_statusline)
> ++          return CURLE_WEIRD_SERVER_REPLY;
> ++      }
> ++    }
> ++
> ++    if(fine_statusline) {
> ++      result =3D Curl_http_statusline(data, data->conn);
> ++      if(result)
> ++        return result;
> ++      writetype |=3D CLIENTWRITE_STATUS;
> ++    }
> ++    else {
> ++      k->header =3D FALSE;   /* this is not a header line */
> ++      return CURLE_WEIRD_SERVER_REPLY;
> ++    }
> ++  }
> ++
> ++  result =3D verify_header(data, hd, hdlen);
> ++  if(result)
> ++    return result;
> ++
> ++  result =3D Curl_http_header(data, hd, hdlen);
> ++  if(result)
> ++    return result;
> ++
> ++  /*
> ++   * Taken in one (more) header. Write it to the client.
> ++   */
> ++  Curl_debug(data, CURLINFO_HEADER_IN, (char *)hd, hdlen);
> ++
> ++  if(k->httpcode/100 =3D=3D 1)
> ++    writetype |=3D CLIENTWRITE_1XX;
> ++  result =3D Curl_client_write(data, writetype, hd, hdlen);
> ++  if(result)
> ++    return result;
> ++
> ++  result =3D Curl_bump_headersize(data, hdlen, FALSE);
> ++  if(result)
> ++    return result;
> ++
> +   return CURLE_OK;
> + }
> ++
> + /*
> +  * Read any HTTP header lines from the server and pass them to the clie=
nt app.
> +  */
> +-static CURLcode http_rw_headers(struct Curl_easy *data,
> +-                                const char *buf, size_t blen,
> +-                                size_t *pconsumed)
> ++static CURLcode http_parse_headers(struct Curl_easy *data,
> ++                                   const char *buf, size_t blen,
> ++                                   size_t *pconsumed)
> + {
> +   struct connectdata *conn =3D data->conn;
> +   CURLcode result =3D CURLE_OK;
> +   struct SingleRequest *k =3D &data->req;
> +-  char *hd;
> +-  size_t hdlen;
> +   char *end_ptr;
> +   bool leftover_body =3D FALSE;
> +
> +   /* header line within buffer loop */
> +   *pconsumed =3D 0;
> +-  do {
> +-    size_t line_length;
> +-    int writetype;
> +-
> +-    /* data is in network encoding so use 0x0a instead of '\n' */
> +-    end_ptr =3D memchr(buf, 0x0a, blen);
> ++  while(blen && k->header) {
> ++    size_t consumed;
> +
> ++    end_ptr =3D memchr(buf, '\n', blen);
> +     if(!end_ptr) {
> +       /* Not a complete header line within buffer, append the data to
> +          the end of the headerbuff. */
> +@@ -3700,14 +3865,13 @@ static CURLcode http_rw_headers(struct Curl_easy=
 *data,
> +     }
> +
> +     /* decrease the size of the remaining (supposed) header line */
> +-    line_length =3D (end_ptr - buf) + 1;
> +-    result =3D Curl_dyn_addn(&data->state.headerb, buf, line_length);
> ++    consumed =3D (end_ptr - buf) + 1;
> ++    result =3D Curl_dyn_addn(&data->state.headerb, buf, consumed);
> +     if(result)
> +       return result;
> +-
> +-    blen -=3D line_length;
> +-    buf +=3D line_length;
> +-    *pconsumed +=3D line_length;
> ++    blen -=3D consumed;
> ++    buf +=3D consumed;
> ++    *pconsumed +=3D consumed;
> +
> +     /****
> +      * We now have a FULL header line in 'headerb'.
> +@@ -3735,195 +3899,21 @@ static CURLcode http_rw_headers(struct Curl_eas=
y *data,
> +       }
> +     }
> +
> +-    /* headers are in network encoding so use 0x0a and 0x0d instead of =
'\n'
> +-       and '\r' */
> +-    hd =3D Curl_dyn_ptr(&data->state.headerb);
> +-    hdlen =3D Curl_dyn_len(&data->state.headerb);
> +-    if((0x0a =3D=3D *hd) || (0x0d =3D=3D *hd)) {
> +-      /* Empty header line means end of headers! */
> +-      size_t consumed;
> +-
> +-      /* now, only output this if the header AND body are requested:
> +-       */
> +-      Curl_debug(data, CURLINFO_HEADER_IN, hd, hdlen);
> +-
> +-      writetype =3D CLIENTWRITE_HEADER |
> +-        ((k->httpcode/100 =3D=3D 1) ? CLIENTWRITE_1XX : 0);
> +-
> +-      result =3D Curl_client_write(data, writetype, hd, hdlen);
> +-      if(result)
> +-        return result;
> +-
> +-      result =3D Curl_bump_headersize(data, hdlen, FALSE);
> +-      if(result)
> +-        return result;
> +-      /* We are done with this line. We reset because response
> +-       * processing might switch to HTTP/2 and that might call us
> +-       * directly again. */
> +-      Curl_dyn_reset(&data->state.headerb);
> +-
> +-      data->req.deductheadercount =3D
> +-        (100 <=3D k->httpcode && 199 >=3D k->httpcode)?data->req.header=
bytecount:0;
> +-
> +-      /* analyze the response to find out what to do */
> +-      result =3D http_on_response(data, buf, blen, &consumed);
> +-      if(result)
> +-        return result;
> +-      *pconsumed +=3D consumed;
> ++    result =3D http_rw_hd(data, Curl_dyn_ptr(&data->state.headerb),
> ++                        Curl_dyn_len(&data->state.headerb),
> ++                        buf, blen, &consumed);
> ++    /* We are done with this line. We reset because response
> ++     * processing might switch to HTTP/2 and that might call us
> ++     * directly again. */
> ++    Curl_dyn_reset(&data->state.headerb);
> ++    if(consumed) {
> +       blen -=3D consumed;
> +       buf +=3D consumed;
> +-
> +-      if(!k->header || !blen)
> +-        goto out; /* exit header line loop */
> +-
> +-      continue;
> +-    }
> +-
> +-    /*
> +-     * Checks for special headers coming up.
> +-     */
> +-
> +-    writetype =3D CLIENTWRITE_HEADER;
> +-    if(!k->headerline++) {
> +-      /* This is the first header, it MUST be the error code line
> +-         or else we consider this to be the body right away! */
> +-      bool fine_statusline =3D FALSE;
> +-
> +-      k->httpversion =3D 0; /* Don't know yet */
> +-      if(conn->handler->protocol & PROTO_FAMILY_HTTP) {
> +-        /*
> +-         * https://datatracker.ietf.org/doc/html/rfc7230#section-3.1.2
> +-         *
> +-         * The response code is always a three-digit number in HTTP as =
the spec
> +-         * says. We allow any three-digit number here, but we cannot ma=
ke
> +-         * guarantees on future behaviors since it isn't within the pro=
tocol.
> +-         */
> +-        char *p =3D hd;
> +-
> +-        while(*p && ISBLANK(*p))
> +-          p++;
> +-        if(!strncmp(p, "HTTP/", 5)) {
> +-          p +=3D 5;
> +-          switch(*p) {
> +-          case '1':
> +-            p++;
> +-            if((p[0] =3D=3D '.') && (p[1] =3D=3D '0' || p[1] =3D=3D '1'=
)) {
> +-              if(ISBLANK(p[2])) {
> +-                k->httpversion =3D 10 + (p[1] - '0');
> +-                p +=3D 3;
> +-                if(ISDIGIT(p[0]) && ISDIGIT(p[1]) && ISDIGIT(p[2])) {
> +-                  k->httpcode =3D (p[0] - '0') * 100 + (p[1] - '0') * 1=
0 +
> +-                    (p[2] - '0');
> +-                  p +=3D 3;
> +-                  if(ISSPACE(*p))
> +-                    fine_statusline =3D TRUE;
> +-                }
> +-              }
> +-            }
> +-            if(!fine_statusline) {
> +-              failf(data, "Unsupported HTTP/1 subversion in response");
> +-              return CURLE_UNSUPPORTED_PROTOCOL;
> +-            }
> +-            break;
> +-          case '2':
> +-          case '3':
> +-            if(!ISBLANK(p[1]))
> +-              break;
> +-            k->httpversion =3D (*p - '0') * 10;
> +-            p +=3D 2;
> +-            if(ISDIGIT(p[0]) && ISDIGIT(p[1]) && ISDIGIT(p[2])) {
> +-              k->httpcode =3D (p[0] - '0') * 100 + (p[1] - '0') * 10 +
> +-                (p[2] - '0');
> +-              p +=3D 3;
> +-              if(!ISSPACE(*p))
> +-                break;
> +-              fine_statusline =3D TRUE;
> +-            }
> +-            break;
> +-          default: /* unsupported */
> +-            failf(data, "Unsupported HTTP version in response");
> +-            return CURLE_UNSUPPORTED_PROTOCOL;
> +-          }
> +-        }
> +-
> +-        if(!fine_statusline) {
> +-          /* If user has set option HTTP200ALIASES,
> +-             compare header line against list of aliases
> +-          */
> +-          statusline check =3D checkhttpprefix(data, hd, hdlen);
> +-          if(check =3D=3D STATUS_DONE) {
> +-            fine_statusline =3D TRUE;
> +-            k->httpcode =3D 200;
> +-            k->httpversion =3D 10;
> +-          }
> +-        }
> +-      }
> +-      else if(conn->handler->protocol & CURLPROTO_RTSP) {
> +-        char *p =3D hd;
> +-        while(*p && ISBLANK(*p))
> +-          p++;
> +-        if(!strncmp(p, "RTSP/", 5)) {
> +-          p +=3D 5;
> +-          if(ISDIGIT(*p)) {
> +-            p++;
> +-            if((p[0] =3D=3D '.') && ISDIGIT(p[1])) {
> +-              if(ISBLANK(p[2])) {
> +-                p +=3D 3;
> +-                if(ISDIGIT(p[0]) && ISDIGIT(p[1]) && ISDIGIT(p[2])) {
> +-                  k->httpcode =3D (p[0] - '0') * 100 + (p[1] - '0') * 1=
0 +
> +-                    (p[2] - '0');
> +-                  p +=3D 3;
> +-                  if(ISSPACE(*p)) {
> +-                    fine_statusline =3D TRUE;
> +-                    k->httpversion =3D 11; /* RTSP acts like HTTP 1.1 *=
/
> +-                  }
> +-                }
> +-              }
> +-            }
> +-          }
> +-          if(!fine_statusline)
> +-            return CURLE_WEIRD_SERVER_REPLY;
> +-        }
> +-      }
> +-
> +-      if(fine_statusline) {
> +-        result =3D Curl_http_statusline(data, conn);
> +-        if(result)
> +-          return result;
> +-        writetype |=3D CLIENTWRITE_STATUS;
> +-      }
> +-      else {
> +-        k->header =3D FALSE;   /* this is not a header line */
> +-        break;
> +-      }
> ++      *pconsumed +=3D consumed;
> +     }
> +-
> +-    result =3D verify_header(data);
> +-    if(result)
> +-      return result;
> +-
> +-    result =3D Curl_http_header(data, conn, hd, hdlen);
> +-    if(result)
> +-      return result;
> +-
> +-    /*
> +-     * Taken in one (more) header. Write it to the client.
> +-     */
> +-    Curl_debug(data, CURLINFO_HEADER_IN, hd, hdlen);
> +-
> +-    if(k->httpcode/100 =3D=3D 1)
> +-      writetype |=3D CLIENTWRITE_1XX;
> +-    result =3D Curl_client_write(data, writetype, hd, hdlen);
> +-    if(result)
> +-      return result;
> +-
> +-    result =3D Curl_bump_headersize(data, hdlen, FALSE);
> +     if(result)
> +       return result;
> +-
> +-    Curl_dyn_reset(&data->state.headerb);
> +   }
> +-  while(blen);
> +
> +   /* We might have reached the end of the header part here, but
> +      there might be a non-header part left in the end of the read
> +@@ -3935,6 +3925,22 @@ static CURLcode http_rw_headers(struct Curl_easy =
*data,
> +   return CURLE_OK;
> + }
> +
> ++CURLcode Curl_http_write_resp_hd(struct Curl_easy *data,
> ++                                 const char *hd, size_t hdlen,
> ++                                 bool is_eos)
> ++{
> ++  CURLcode result;
> ++  size_t consumed;
> ++  char tmp =3D 0;
> ++
> ++  result =3D http_rw_hd(data, hd, hdlen, &tmp, 0, &consumed);
> ++  if(!result && is_eos) {
> ++    result =3D Curl_client_write(data, (CLIENTWRITE_BODY|CLIENTWRITE_EO=
S),
> ++                               &tmp, 0);
> ++  }
> ++  return result;
> ++}
> ++
> + /*
> +  * HTTP protocol `write_resp` implementation. Will parse headers
> +  * when not done yet and otherwise return without consuming data.
> +@@ -3950,11 +3956,8 @@ CURLcode Curl_http_write_resp_hds(struct Curl_eas=
y *data,
> +   else {
> +     CURLcode result;
> +
> +-    result =3D http_rw_headers(data, buf, blen, pconsumed);
> ++    result =3D http_parse_headers(data, buf, blen, pconsumed);
> +     if(!result && !data->req.header) {
> +-      /* we have successfully finished parsing the HEADERs */
> +-      result =3D Curl_http_firstwrite(data);
> +-
> +       if(!data->req.no_body && Curl_dyn_len(&data->state.headerb)) {
> +         /* leftover from parsing something that turned out not
> +          * to be a header, only happens if we allow for
> +diff --git a/lib/http.h b/lib/http.h
> +index 047709f20fc5..47fae63c782b 100644
> +--- a/lib/http.h
> ++++ b/lib/http.h
> +@@ -102,8 +102,8 @@ CURLcode Curl_http_target(struct Curl_easy *data, st=
ruct connectdata *conn,
> +                           struct dynbuf *req);
> + CURLcode Curl_http_statusline(struct Curl_easy *data,
> +                               struct connectdata *conn);
> +-CURLcode Curl_http_header(struct Curl_easy *data, struct connectdata *c=
onn,
> +-                          char *headp, size_t hdlen);
> ++CURLcode Curl_http_header(struct Curl_easy *data,
> ++                          const char *hd, size_t hdlen);
> + CURLcode Curl_transferencode(struct Curl_easy *data);
> + CURLcode Curl_http_req_set_reader(struct Curl_easy *data,
> +                                   Curl_HttpReq httpreq,
> +@@ -134,6 +134,9 @@ int Curl_http_getsock_do(struct Curl_easy *data, str=
uct connectdata *conn,
> + CURLcode Curl_http_write_resp(struct Curl_easy *data,
> +                               const char *buf, size_t blen,
> +                               bool is_eos);
> ++CURLcode Curl_http_write_resp_hd(struct Curl_easy *data,
> ++                                 const char *hd, size_t hdlen,
> ++                                 bool is_eos);
> +
> + /* These functions are in http.c */
> + CURLcode Curl_http_input_auth(struct Curl_easy *data, bool proxy,
> +diff --git a/lib/http2.c b/lib/http2.c
> +index fb097c51bbfa..ca224fd6670c 100644
> +--- a/lib/http2.c
> ++++ b/lib/http2.c
> +@@ -127,6 +127,7 @@ struct cf_h2_ctx {
> +   struct bufq inbufq;           /* network input */
> +   struct bufq outbufq;          /* network output */
> +   struct bufc_pool stream_bufcp; /* spares for stream buffers */
> ++  struct dynbuf scratch;        /* scratch buffer for temp use */
> +
> +   size_t drain_total; /* sum of all stream's UrlState drain */
> +   uint32_t max_concurrent_streams;
> +@@ -153,6 +154,7 @@ static void cf_h2_ctx_clear(struct cf_h2_ctx *ctx)
> +   Curl_bufq_free(&ctx->inbufq);
> +   Curl_bufq_free(&ctx->outbufq);
> +   Curl_bufcp_free(&ctx->stream_bufcp);
> ++  Curl_dyn_free(&ctx->scratch);
> +   memset(ctx, 0, sizeof(*ctx));
> +   ctx->call_data =3D save;
> + }
> +@@ -408,6 +410,7 @@ static CURLcode cf_h2_ctx_init(struct Curl_cfilter *=
cf,
> +   Curl_bufcp_init(&ctx->stream_bufcp, H2_CHUNK_SIZE, H2_STREAM_POOL_SPA=
RES);
> +   Curl_bufq_initp(&ctx->inbufq, &ctx->stream_bufcp, H2_NW_RECV_CHUNKS, =
0);
> +   Curl_bufq_initp(&ctx->outbufq, &ctx->stream_bufcp, H2_NW_SEND_CHUNKS,=
 0);
> ++  Curl_dyn_init(&ctx->scratch, CURL_MAX_HTTP_HEADER);
> +   ctx->last_stream_id =3D 2147483647;
> +
> +   rc =3D nghttp2_session_callbacks_new(&cbs);
> +@@ -945,14 +948,6 @@ static int push_promise(struct Curl_cfilter *cf,
> +   return rv;
> + }
> +
> +-static CURLcode recvbuf_write_hds(struct Curl_cfilter *cf,
> +-                                  struct Curl_easy *data,
> +-                                  const char *buf, size_t blen)
> +-{
> +-  (void)cf;
> +-  return Curl_xfer_write_resp(data, (char *)buf, blen, FALSE);
> +-}
> +-
> + static CURLcode on_stream_frame(struct Curl_cfilter *cf,
> +                                 struct Curl_easy *data,
> +                                 const nghttp2_frame *frame)
> +@@ -1008,7 +1003,7 @@ static CURLcode on_stream_frame(struct Curl_cfilte=
r *cf,
> +       stream->status_code =3D -1;
> +     }
> +
> +-    result =3D recvbuf_write_hds(cf, data, STRCONST("\r\n"));
> ++    result =3D Curl_xfer_write_resp_hd(data, STRCONST("\r\n"), stream->=
closed);
> +     if(result)
> +       return result;
> +
> +@@ -1359,6 +1354,7 @@ static int on_header(nghttp2_session *session, con=
st nghttp2_frame *frame,
> +                      void *userp)
> + {
> +   struct Curl_cfilter *cf =3D userp;
> ++  struct cf_h2_ctx *ctx =3D cf->ctx;
> +   struct h2_stream_ctx *stream;
> +   struct Curl_easy *data_s;
> +   int32_t stream_id =3D frame->hd.stream_id;
> +@@ -1468,14 +1464,15 @@ static int on_header(nghttp2_session *session, c=
onst nghttp2_frame *frame,
> +     result =3D Curl_headers_push(data_s, buffer, CURLH_PSEUDO);
> +     if(result)
> +       return NGHTTP2_ERR_CALLBACK_FAILURE;
> +-    result =3D recvbuf_write_hds(cf, data_s, STRCONST("HTTP/2 "));
> +-    if(result)
> +-      return NGHTTP2_ERR_CALLBACK_FAILURE;
> +-    result =3D recvbuf_write_hds(cf, data_s, (const char *)value, value=
len);
> +-    if(result)
> +-      return NGHTTP2_ERR_CALLBACK_FAILURE;
> +-    /* the space character after the status code is mandatory */
> +-    result =3D recvbuf_write_hds(cf, data_s, STRCONST(" \r\n"));
> ++    Curl_dyn_reset(&ctx->scratch);
> ++    result =3D Curl_dyn_addn(&ctx->scratch, STRCONST("HTTP/2 "));
> ++    if(!result)
> ++      result =3D Curl_dyn_addn(&ctx->scratch, value, valuelen);
> ++    if(!result)
> ++      result =3D Curl_dyn_addn(&ctx->scratch, STRCONST(" \r\n"));
> ++    if(!result)
> ++      result =3D Curl_xfer_write_resp_hd(data_s, Curl_dyn_ptr(&ctx->scr=
atch),
> ++                                       Curl_dyn_len(&ctx->scratch), FAL=
SE);
> +     if(result)
> +       return NGHTTP2_ERR_CALLBACK_FAILURE;
> +     /* if we receive data for another handle, wake that up */
> +@@ -1490,16 +1487,17 @@ static int on_header(nghttp2_session *session, c=
onst nghttp2_frame *frame,
> +   /* nghttp2 guarantees that namelen > 0, and :status was already
> +      received, and this is not pseudo-header field . */
> +   /* convert to an HTTP1-style header */
> +-  result =3D recvbuf_write_hds(cf, data_s, (const char *)name, namelen)=
;
> +-  if(result)
> +-    return NGHTTP2_ERR_CALLBACK_FAILURE;
> +-  result =3D recvbuf_write_hds(cf, data_s, STRCONST(": "));
> +-  if(result)
> +-    return NGHTTP2_ERR_CALLBACK_FAILURE;
> +-  result =3D recvbuf_write_hds(cf, data_s, (const char *)value, valuele=
n);
> +-  if(result)
> +-    return NGHTTP2_ERR_CALLBACK_FAILURE;
> +-  result =3D recvbuf_write_hds(cf, data_s, STRCONST("\r\n"));
> ++  Curl_dyn_reset(&ctx->scratch);
> ++  result =3D Curl_dyn_addn(&ctx->scratch, (const char *)name, namelen);
> ++  if(!result)
> ++    result =3D Curl_dyn_addn(&ctx->scratch, STRCONST(": "));
> ++  if(!result)
> ++    result =3D Curl_dyn_addn(&ctx->scratch, (const char *)value, valuel=
en);
> ++  if(!result)
> ++    result =3D Curl_dyn_addn(&ctx->scratch, STRCONST("\r\n"));
> ++  if(!result)
> ++    result =3D Curl_xfer_write_resp_hd(data_s, Curl_dyn_ptr(&ctx->scrat=
ch),
> ++                                     Curl_dyn_len(&ctx->scratch), FALSE=
);
> +   if(result)
> +     return NGHTTP2_ERR_CALLBACK_FAILURE;
> +   /* if we receive data for another handle, wake that up */
> +diff --git a/lib/imap.c b/lib/imap.c
> +index 0e013e740ae9..679bfae977f4 100644
> +--- a/lib/imap.c
> ++++ b/lib/imap.c
> +@@ -131,6 +131,7 @@ const struct Curl_handler Curl_handler_imap =3D {
> +   ZERO_NULL,                        /* perform_getsock */
> +   imap_disconnect,                  /* disconnect */
> +   ZERO_NULL,                        /* write_resp */
> ++  ZERO_NULL,                        /* write_resp_hd */
> +   ZERO_NULL,                        /* connection_check */
> +   ZERO_NULL,                        /* attach connection */
> +   PORT_IMAP,                        /* defport */
> +@@ -160,6 +161,7 @@ const struct Curl_handler Curl_handler_imaps =3D {
> +   ZERO_NULL,                        /* perform_getsock */
> +   imap_disconnect,                  /* disconnect */
> +   ZERO_NULL,                        /* write_resp */
> ++  ZERO_NULL,                        /* write_resp_hd */
> +   ZERO_NULL,                        /* connection_check */
> +   ZERO_NULL,                        /* attach connection */
> +   PORT_IMAPS,                       /* defport */
> +diff --git a/lib/ldap.c b/lib/ldap.c
> +index 394fd32d4a14..e2546aa59eca 100644
> +--- a/lib/ldap.c
> ++++ b/lib/ldap.c
> +@@ -178,6 +178,7 @@ const struct Curl_handler Curl_handler_ldap =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ZERO_NULL,                            /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_LDAP,                            /* defport */
> +@@ -206,6 +207,7 @@ const struct Curl_handler Curl_handler_ldaps =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ZERO_NULL,                            /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_LDAPS,                           /* defport */
> +diff --git a/lib/mqtt.c b/lib/mqtt.c
> +index 9290da031ba3..35458648daee 100644
> +--- a/lib/mqtt.c
> ++++ b/lib/mqtt.c
> +@@ -89,6 +89,7 @@ const struct Curl_handler Curl_handler_mqtt =3D {
> +   ZERO_NULL,                          /* perform_getsock */
> +   ZERO_NULL,                          /* disconnect */
> +   ZERO_NULL,                          /* write_resp */
> ++  ZERO_NULL,                          /* write_resp_hd */
> +   ZERO_NULL,                          /* connection_check */
> +   ZERO_NULL,                          /* attach connection */
> +   PORT_MQTT,                          /* defport */
> +diff --git a/lib/openldap.c b/lib/openldap.c
> +index 85a37b818604..a5fac50577d3 100644
> +--- a/lib/openldap.c
> ++++ b/lib/openldap.c
> +@@ -131,6 +131,7 @@ const struct Curl_handler Curl_handler_ldap =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   oldap_disconnect,                     /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_LDAP,                            /* defport */
> +@@ -159,6 +160,7 @@ const struct Curl_handler Curl_handler_ldaps =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   oldap_disconnect,                     /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_LDAPS,                           /* defport */
> +diff --git a/lib/pop3.c b/lib/pop3.c
> +index 993b2e1c7f52..85c12cbf2cd3 100644
> +--- a/lib/pop3.c
> ++++ b/lib/pop3.c
> +@@ -126,6 +126,7 @@ const struct Curl_handler Curl_handler_pop3 =3D {
> +   ZERO_NULL,                        /* perform_getsock */
> +   pop3_disconnect,                  /* disconnect */
> +   ZERO_NULL,                        /* write_resp */
> ++  ZERO_NULL,                        /* write_resp_hd */
> +   ZERO_NULL,                        /* connection_check */
> +   ZERO_NULL,                        /* attach connection */
> +   PORT_POP3,                        /* defport */
> +@@ -155,6 +156,7 @@ const struct Curl_handler Curl_handler_pop3s =3D {
> +   ZERO_NULL,                        /* perform_getsock */
> +   pop3_disconnect,                  /* disconnect */
> +   ZERO_NULL,                        /* write_resp */
> ++  ZERO_NULL,                        /* write_resp_hd */
> +   ZERO_NULL,                        /* connection_check */
> +   ZERO_NULL,                        /* attach connection */
> +   PORT_POP3S,                       /* defport */
> +@@ -1450,7 +1452,7 @@ static CURLcode pop3_parse_custom_request(struct C=
url_easy *data)
> +  * This function scans the body after the end-of-body and writes everyt=
hing
> +  * until the end is found.
> +  */
> +-CURLcode Curl_pop3_write(struct Curl_easy *data, char *str, size_t nrea=
d)
> ++CURLcode Curl_pop3_write(struct Curl_easy *data, const char *str, size_=
t nread)
> + {
> +   /* This code could be made into a special function in the handler str=
uct */
> +   CURLcode result =3D CURLE_OK;
> +diff --git a/lib/pop3.h b/lib/pop3.h
> +index 83f0f831e6c1..e8e98db04b62 100644
> +--- a/lib/pop3.h
> ++++ b/lib/pop3.h
> +@@ -92,6 +92,7 @@ extern const struct Curl_handler Curl_handler_pop3s;
> +
> + /* This function scans the body after the end-of-body and writes everyt=
hing
> +  * until the end is found */
> +-CURLcode Curl_pop3_write(struct Curl_easy *data, char *str, size_t nrea=
d);
> ++CURLcode Curl_pop3_write(struct Curl_easy *data,
> ++                         const char *str, size_t nread);
> +
> + #endif /* HEADER_CURL_POP3_H */
> +diff --git a/lib/request.c b/lib/request.c
> +index 40515a990754..d1605d32a165 100644
> +--- a/lib/request.c
> ++++ b/lib/request.c
> +@@ -266,7 +266,7 @@ static CURLcode req_set_upload_done(struct Curl_easy=
 *data)
> +   else if(data->req.writebytecount)
> +     infof(data, "upload completely sent off: %" CURL_FORMAT_CURL_OFF_T
> +           " bytes", data->req.writebytecount);
> +-  else
> ++  else if(!data->req.download_done)
> +     infof(data, Curl_creader_total_length(data)?
> +                 "We are completely uploaded and fine" :
> +                 "Request completely sent off");
> +diff --git a/lib/rtsp.c b/lib/rtsp.c
> +index 7251c062b1b0..ab7fda4c0636 100644
> +--- a/lib/rtsp.c
> ++++ b/lib/rtsp.c
> +@@ -93,7 +93,7 @@ static int rtsp_getsock_do(struct Curl_easy *data, str=
uct connectdata *conn,
> + static
> + CURLcode rtp_client_write(struct Curl_easy *data, const char *ptr, size=
_t len);
> + static
> +-CURLcode rtsp_parse_transport(struct Curl_easy *data, char *transport);
> ++CURLcode rtsp_parse_transport(struct Curl_easy *data, const char *trans=
port);
> +
> +
> + /*
> +@@ -114,6 +114,7 @@ const struct Curl_handler Curl_handler_rtsp =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   rtsp_disconnect,                      /* disconnect */
> +   rtsp_rtp_write_resp,                  /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   rtsp_conncheck,                       /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_RTSP,                            /* defport */
> +@@ -913,12 +914,12 @@ CURLcode rtp_client_write(struct Curl_easy *data, =
const char *ptr, size_t len)
> +   return CURLE_OK;
> + }
> +
> +-CURLcode Curl_rtsp_parseheader(struct Curl_easy *data, char *header)
> ++CURLcode Curl_rtsp_parseheader(struct Curl_easy *data, const char *head=
er)
> + {
> +   if(checkprefix("CSeq:", header)) {
> +     long CSeq =3D 0;
> +     char *endp;
> +-    char *p =3D &header[5];
> ++    const char *p =3D &header[5];
> +     while(ISBLANK(*p))
> +       p++;
> +     CSeq =3D strtol(p, &endp, 10);
> +@@ -933,8 +934,7 @@ CURLcode Curl_rtsp_parseheader(struct Curl_easy *dat=
a, char *header)
> +     }
> +   }
> +   else if(checkprefix("Session:", header)) {
> +-    char *start;
> +-    char *end;
> ++    const char *start, *end;
> +     size_t idlen;
> +
> +     /* Find the first non-space letter */
> +@@ -989,14 +989,13 @@ CURLcode Curl_rtsp_parseheader(struct Curl_easy *d=
ata, char *header)
> + }
> +
> + static
> +-CURLcode rtsp_parse_transport(struct Curl_easy *data, char *transport)
> ++CURLcode rtsp_parse_transport(struct Curl_easy *data, const char *trans=
port)
> + {
> +   /* If we receive multiple Transport response-headers, the linterleave=
d
> +      channels of each response header is recorded and used together for
> +      subsequent data validity checks.*/
> +   /* e.g.: ' RTP/AVP/TCP;unicast;interleaved=3D5-6' */
> +-  char *start;
> +-  char *end;
> ++  const char *start, *end;
> +   start =3D transport;
> +   while(start && *start) {
> +     while(*start && ISBLANK(*start) )
> +@@ -1005,7 +1004,7 @@ CURLcode rtsp_parse_transport(struct Curl_easy *da=
ta, char *transport)
> +     if(checkprefix("interleaved=3D", start)) {
> +       long chan1, chan2, chan;
> +       char *endp;
> +-      char *p =3D start + 12;
> ++      const char *p =3D start + 12;
> +       chan1 =3D strtol(p, &endp, 10);
> +       if(p !=3D endp && chan1 >=3D 0 && chan1 <=3D 255) {
> +         unsigned char *rtp_channel_mask =3D data->state.rtp_channel_mas=
k;
> +diff --git a/lib/rtsp.h b/lib/rtsp.h
> +index 237b80f809fa..b1ffa5c7ea65 100644
> +--- a/lib/rtsp.h
> ++++ b/lib/rtsp.h
> +@@ -31,7 +31,7 @@
> +
> + extern const struct Curl_handler Curl_handler_rtsp;
> +
> +-CURLcode Curl_rtsp_parseheader(struct Curl_easy *data, char *header);
> ++CURLcode Curl_rtsp_parseheader(struct Curl_easy *data, const char *head=
er);
> +
> + #else
> + /* disabled */
> +diff --git a/lib/smb.c b/lib/smb.c
> +index 77d34e31c483..2ce6dbf7fc11 100644
> +--- a/lib/smb.c
> ++++ b/lib/smb.c
> +@@ -273,6 +273,7 @@ const struct Curl_handler Curl_handler_smb =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   smb_disconnect,                       /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_SMB,                             /* defport */
> +@@ -300,6 +301,7 @@ const struct Curl_handler Curl_handler_smbs =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   smb_disconnect,                       /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_SMBS,                            /* defport */
> +diff --git a/lib/smtp.c b/lib/smtp.c
> +index 20763c0c823b..dc2f1c91804e 100644
> +--- a/lib/smtp.c
> ++++ b/lib/smtp.c
> +@@ -132,6 +132,7 @@ const struct Curl_handler Curl_handler_smtp =3D {
> +   ZERO_NULL,                        /* perform_getsock */
> +   smtp_disconnect,                  /* disconnect */
> +   ZERO_NULL,                        /* write_resp */
> ++  ZERO_NULL,                        /* write_resp_hd */
> +   ZERO_NULL,                        /* connection_check */
> +   ZERO_NULL,                        /* attach connection */
> +   PORT_SMTP,                        /* defport */
> +@@ -161,6 +162,7 @@ const struct Curl_handler Curl_handler_smtps =3D {
> +   ZERO_NULL,                        /* perform_getsock */
> +   smtp_disconnect,                  /* disconnect */
> +   ZERO_NULL,                        /* write_resp */
> ++  ZERO_NULL,                        /* write_resp_hd */
> +   ZERO_NULL,                        /* connection_check */
> +   ZERO_NULL,                        /* attach connection */
> +   PORT_SMTPS,                       /* defport */
> +diff --git a/lib/telnet.c b/lib/telnet.c
> +index 56ee0855f0f8..b129ff520210 100644
> +--- a/lib/telnet.c
> ++++ b/lib/telnet.c
> +@@ -187,6 +187,7 @@ const struct Curl_handler Curl_handler_telnet =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ZERO_NULL,                            /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_TELNET,                          /* defport */
> +diff --git a/lib/tftp.c b/lib/tftp.c
> +index ff2b7b7457b2..4667ae1e42d6 100644
> +--- a/lib/tftp.c
> ++++ b/lib/tftp.c
> +@@ -182,6 +182,7 @@ const struct Curl_handler Curl_handler_tftp =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   tftp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_TFTP,                            /* defport */
> +diff --git a/lib/transfer.c b/lib/transfer.c
> +index ac4710ef5d3c..6e2067cd6a27 100644
> +--- a/lib/transfer.c
> ++++ b/lib/transfer.c
> +@@ -1156,7 +1156,7 @@ void Curl_xfer_setup(
> + }
> +
> + CURLcode Curl_xfer_write_resp(struct Curl_easy *data,
> +-                              char *buf, size_t blen,
> ++                              const char *buf, size_t blen,
> +                               bool is_eos)
> + {
> +   CURLcode result =3D CURLE_OK;
> +@@ -1195,6 +1195,18 @@ CURLcode Curl_xfer_write_resp(struct Curl_easy *d=
ata,
> +   return result;
> + }
> +
> ++CURLcode Curl_xfer_write_resp_hd(struct Curl_easy *data,
> ++                                 const char *hd0, size_t hdlen, bool is=
_eos)
> ++{
> ++  if(data->conn->handler->write_resp_hd) {
> ++    /* protocol handlers offering this function take full responsibilit=
y
> ++     * for writing all received download data to the client. */
> ++    return data->conn->handler->write_resp_hd(data, hd0, hdlen, is_eos)=
;
> ++  }
> ++  /* No special handling by protocol handler, write as response bytes *=
/
> ++  return Curl_xfer_write_resp(data, hd0, hdlen, is_eos);
> ++}
> ++
> + CURLcode Curl_xfer_write_done(struct Curl_easy *data, bool premature)
> + {
> +   (void)premature;
> +diff --git a/lib/transfer.h b/lib/transfer.h
> +index e65b2b147215..ad0f3a20cc95 100644
> +--- a/lib/transfer.h
> ++++ b/lib/transfer.h
> +@@ -62,12 +62,20 @@ bool Curl_meets_timecondition(struct Curl_easy *data=
, time_t timeofdoc);
> +  * @param blen     the amount of bytes in `buf`
> +  * @param is_eos   TRUE iff the connection indicates this to be the las=
t
> +  *                 bytes of the response
> +- * @param done     on returnm, TRUE iff the response is complete
> +  */
> + CURLcode Curl_xfer_write_resp(struct Curl_easy *data,
> +-                              char *buf, size_t blen,
> ++                              const char *buf, size_t blen,
> +                               bool is_eos);
> +
> ++/**
> ++ * Write a single "header" line from a server response.
> ++ * @param hd0      the 0-terminated, single header line
> ++ * @param hdlen    the length of the header line
> ++ * @param is_eos   TRUE iff this is the end of the response
> ++ */
> ++CURLcode Curl_xfer_write_resp_hd(struct Curl_easy *data,
> ++                                 const char *hd0, size_t hdlen, bool is=
_eos);
> ++
> + /* This sets up a forthcoming transfer */
> + void Curl_xfer_setup(struct Curl_easy *data,
> +                      int sockindex,     /* socket index to read from or=
 -1 */
> +diff --git a/lib/urldata.h b/lib/urldata.h
> +index 90f4d1bb574c..308c51c92379 100644
> +--- a/lib/urldata.h
> ++++ b/lib/urldata.h
> +@@ -701,12 +701,18 @@ struct Curl_handler {
> +   CURLcode (*disconnect)(struct Curl_easy *, struct connectdata *,
> +                          bool dead_connection);
> +
> +-  /* If used, this function gets called from transfer.c:readwrite_data(=
) to
> ++  /* If used, this function gets called from transfer.c to
> +      allow the protocol to do extra handling in writing response to
> +      the client. */
> +   CURLcode (*write_resp)(struct Curl_easy *data, const char *buf, size_=
t blen,
> +                          bool is_eos);
> +
> ++  /* If used, this function gets called from transfer.c to
> ++     allow the protocol to do extra handling in writing a single respon=
se
> ++     header line to the client. */
> ++  CURLcode (*write_resp_hd)(struct Curl_easy *data,
> ++                            const char *hd, size_t hdlen, bool is_eos);
> ++
> +   /* This function can perform various checks on the connection. See
> +      CONNCHECK_* for more information about the checks that can be perf=
ormed,
> +      and CONNRESULT_* for the results that can be returned. */
> +diff --git a/lib/vquic/curl_ngtcp2.c b/lib/vquic/curl_ngtcp2.c
> +index eea8e1261e75..74006b47277c 100644
> +--- a/lib/vquic/curl_ngtcp2.c
> ++++ b/lib/vquic/curl_ngtcp2.c
> +@@ -130,6 +130,7 @@ struct cf_ngtcp2_ctx {
> +   struct curltime handshake_at;      /* time connect handshake finished=
 */
> +   struct curltime reconnect_at;      /* time the next attempt should st=
art */
> +   struct bufc_pool stream_bufcp;     /* chunk pool for streams */
> ++  struct dynbuf scratch;             /* temp buffer for header construc=
tion */
> +   size_t max_stream_window;          /* max flow window for one stream =
*/
> +   uint64_t max_idle_ms;              /* max idle time for QUIC connecti=
on */
> +   int qlogfd;
> +@@ -765,12 +766,6 @@ static int cb_h3_stream_close(nghttp3_conn *conn, i=
nt64_t sid,
> +   return 0;
> + }
> +
> +-static CURLcode write_resp_hds(struct Curl_easy *data,
> +-                               const char *buf, size_t blen)
> +-{
> +-  return Curl_xfer_write_resp(data, (char *)buf, blen, FALSE);
> +-}
> +-
> + static int cb_h3_recv_data(nghttp3_conn *conn, int64_t stream3_id,
> +                            const uint8_t *buf, size_t blen,
> +                            void *user_data, void *stream_user_data)
> +@@ -828,7 +828,7 @@ static int cb_h3_end_headers(nghttp3_con
> +   if(!stream)
> +     return 0;
> +   /* add a CRLF only if we've received some headers */
> +-  result =3D write_resp_hds(data, "\r\n", 2);
> ++  result =3D Curl_xfer_write_resp_hd(data, STRCONST("\r\n"), stream->cl=
osed);
> +   if(result) {
> +     return -1;
> +   }
> +@@ -848,6 +848,7 @@ static int cb_h3_recv_header(nghttp3_con
> +                              void *user_data, void *stream_user_data)
> + {
> +   struct Curl_cfilter *cf =3D user_data;
> ++  struct cf_ngtcp2_ctx *ctx =3D cf->ctx;
> +   nghttp3_vec h3name =3D nghttp3_rcbuf_get_buf(name);
> +   nghttp3_vec h3val =3D nghttp3_rcbuf_get_buf(value);
> +   struct Curl_easy *data =3D stream_user_data;
> +@@ -864,17 +865,23 @@ static int cb_h3_recv_header(nghttp3_con
> +     return 0;
> +
> +   if(token =3D=3D NGHTTP3_QPACK_TOKEN__STATUS) {
> +-    char line[14]; /* status line is always 13 characters long */
> +-    size_t ncopy;
> +
> +     result =3D Curl_http_decode_status(&stream->status_code,
> +                                      (const char *)h3val.base, h3val.le=
n);
> +     if(result)
> +       return -1;
> +-    ncopy =3D msnprintf(line, sizeof(line), "HTTP/3 %03d \r\n",
> +-                      stream->status_code);
> +-    CURL_TRC_CF(data, cf, "[%" PRId64 "] status: %s", stream_id, line);
> +-    result =3D write_resp_hds(data, line, ncopy);
> ++    Curl_dyn_reset(&ctx->scratch);
> ++    result =3D Curl_dyn_addn(&ctx->scratch, STRCONST("HTTP/3 "));
> ++    if(!result)
> ++      result =3D Curl_dyn_addn(&ctx->scratch,
> ++                             (const char *)h3val.base, h3val.len);
> ++    if(!result)
> ++      result =3D Curl_dyn_addn(&ctx->scratch, STRCONST(" \r\n"));
> ++    if(!result)
> ++      result =3D Curl_xfer_write_resp_hd(data, Curl_dyn_ptr(&ctx->scrat=
ch),
> ++                                       Curl_dyn_len(&ctx->scratch), FAL=
SE);
> ++    CURL_TRC_CF(data, cf, "[%" CURL_PRId64 "] status: %s",
> ++                stream_id, Curl_dyn_ptr(&ctx->scratch));
> +     if(result) {
> +       return -1;
> +     }
> +@@ -884,19 +891,19 @@ static int cb_h3_recv_header(nghttp3_con
> +     CURL_TRC_CF(data, cf, "[%" PRId64 "] header: %.*s: %.*s",
> +                 stream_id, (int)h3name.len, h3name.base,
> +                 (int)h3val.len, h3val.base);
> +-    result =3D write_resp_hds(data, (const char *)h3name.base, h3name.l=
en);
> +-    if(result) {
> +-      return -1;
> +-    }
> +-    result =3D write_resp_hds(data, ": ", 2);
> +-    if(result) {
> +-      return -1;
> +-    }
> +-    result =3D write_resp_hds(data, (const char *)h3val.base, h3val.len=
);
> +-    if(result) {
> +-      return -1;
> +-    }
> +-    result =3D write_resp_hds(data, "\r\n", 2);
> ++    Curl_dyn_reset(&ctx->scratch);
> ++    result =3D Curl_dyn_addn(&ctx->scratch,
> ++                           (const char *)h3name.base, h3name.len);
> ++    if(!result)
> ++      result =3D Curl_dyn_addn(&ctx->scratch, STRCONST(": "));
> ++    if(!result)
> ++      result =3D Curl_dyn_addn(&ctx->scratch,
> ++                             (const char *)h3val.base, h3val.len);
> ++    if(!result)
> ++      result =3D Curl_dyn_addn(&ctx->scratch, STRCONST("\r\n"));
> ++    if(!result)
> ++      result =3D Curl_xfer_write_resp_hd(data, Curl_dyn_ptr(&ctx->scrat=
ch),
> ++                                       Curl_dyn_len(&ctx->scratch), FAL=
SE);
> +     if(result) {
> +       return -1;
> +     }
> +@@ -1846,6 +1853,7 @@ static void cf_ngtcp2_ctx_clear(struct c
> +   if(ctx->qconn)
> +     ngtcp2_conn_del(ctx->qconn);
> +   Curl_bufcp_free(&ctx->stream_bufcp);
> ++  Curl_dyn_free(&ctx->scratch);
> +   Curl_ssl_peer_cleanup(&ctx->peer);
> +
> +   memset(ctx, 0, sizeof(*ctx));
> +@@ -1948,6 +1956,7 @@ static CURLcode cf_connect_start(struct
> +   ctx->max_idle_ms =3D CURL_QUIC_MAX_IDLE_MS;
> +   Curl_bufcp_init(&ctx->stream_bufcp, H3_STREAM_CHUNK_SIZE,
> +                   H3_STREAM_POOL_SPARES);
> ++  Curl_dyn_init(&ctx->scratch, CURL_MAX_HTTP_HEADER);
> +
> +   result =3D Curl_ssl_peer_init(&ctx->peer, cf);
> +   if(result)
> +diff --git a/lib/vssh/libssh.c b/lib/vssh/libssh.c
> +index da7ce6ad9890..d6ba987f1c7c 100644
> +--- a/lib/vssh/libssh.c
> ++++ b/lib/vssh/libssh.c
> +@@ -162,6 +162,7 @@ const struct Curl_handler Curl_handler_scp =3D {
> +   myssh_getsock,                /* perform_getsock */
> +   scp_disconnect,               /* disconnect */
> +   ZERO_NULL,                    /* write_resp */
> ++  ZERO_NULL,                    /* write_resp_hd */
> +   ZERO_NULL,                    /* connection_check */
> +   ZERO_NULL,                    /* attach connection */
> +   PORT_SSH,                     /* defport */
> +@@ -189,6 +190,7 @@ const struct Curl_handler Curl_handler_sftp =3D {
> +   myssh_getsock,                        /* perform_getsock */
> +   sftp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_SSH,                             /* defport */
> +diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
> +index 7d8d5f46571e..6c5704b6a4ec 100644
> +--- a/lib/vssh/libssh2.c
> ++++ b/lib/vssh/libssh2.c
> +@@ -139,6 +139,7 @@ const struct Curl_handler Curl_handler_scp =3D {
> +   ssh_getsock,                          /* perform_getsock */
> +   scp_disconnect,                       /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ssh_attach,                           /* attach */
> +   PORT_SSH,                             /* defport */
> +@@ -168,6 +169,7 @@ const struct Curl_handler Curl_handler_sftp =3D {
> +   ssh_getsock,                          /* perform_getsock */
> +   sftp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ssh_attach,                           /* attach */
> +   PORT_SSH,                             /* defport */
> +diff --git a/lib/vssh/wolfssh.c b/lib/vssh/wolfssh.c
> +index 11275910a1f9..6a5aed88f74f 100644
> +--- a/lib/vssh/wolfssh.c
> ++++ b/lib/vssh/wolfssh.c
> +@@ -94,6 +94,7 @@ const struct Curl_handler Curl_handler_scp =3D {
> +   wssh_getsock,                         /* perform_getsock */
> +   wscp_disconnect,                      /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_SSH,                             /* defport */
> +@@ -123,6 +124,7 @@ const struct Curl_handler Curl_handler_sftp =3D {
> +   wssh_getsock,                         /* perform_getsock */
> +   wsftp_disconnect,                     /* disconnect */
> +   ZERO_NULL,                            /* write_resp */
> ++  ZERO_NULL,                            /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_SSH,                             /* defport */
> +diff --git a/lib/ws.c b/lib/ws.c
> +index 907f64bac3f5..d6a83be90f64 100644
> +--- a/lib/ws.c
> ++++ b/lib/ws.c
> +@@ -1199,6 +1199,7 @@ const struct Curl_handler Curl_handler_ws =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ws_disconnect,                        /* disconnect */
> +   Curl_http_write_resp,                 /* write_resp */
> ++  Curl_http_write_resp_hd,              /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_HTTP,                            /* defport */
> +@@ -1224,6 +1225,7 @@ const struct Curl_handler Curl_handler_wss =3D {
> +   ZERO_NULL,                            /* perform_getsock */
> +   ws_disconnect,                        /* disconnect */
> +   Curl_http_write_resp,                 /* write_resp */
> ++  Curl_http_write_resp_hd,              /* write_resp_hd */
> +   ZERO_NULL,                            /* connection_check */
> +   ZERO_NULL,                            /* attach connection */
> +   PORT_HTTPS,                           /* defport */
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 9e37684b2c..d2c5682eaf 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -32,6 +32,8 @@ SRC_URI =3D " \
>      file://CVE-2025-14819.patch \
>      file://CVE-2025-15079.patch \
>      file://CVE-2025-15224.patch \
> +    file://lib-add-Curl_xfer_write_resp_hd.patch \
> +    file://http2-ngtcp2-pass-CURLcode-errors-from-callbacks.patch \
>  "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS



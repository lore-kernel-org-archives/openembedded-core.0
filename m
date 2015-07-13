Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id A452B65C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:33:03 +0000 (UTC)
Received: by oibn4 with SMTP id n4so17730415oib.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 00:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3K9C7ColNa5541CVG8jIFr3UNWp/ME7m6vAtOU9ovn8=;
	b=k4cNqNXa1GhfYQTDAYQRefgANhlNYrmss7v47nZrjzzSizjQC61rCf1l7h/F4DFd6I
	3KOXjrBQDV2AEYB4MNCHoFu5Os3kB5v5FXQl0BCe3IoFKonZ2o4vXa/jNQ6SqHl6d6Ho
	mu3GtMzU+pmnQFodtFEbffmkCVkII2VusCn5Xiwfht61c11E0tcpgJ1tWIy9YwM0oM6d
	Ox79m1XuIaKHFouZ7Nms8Tw9iuKzXy0jJ2Bz1KmZwz+1YlERaum2XOPTs3nCrQGH0GIi
	JYIvE61Z14B+GztX2Wr4x2jg5bThkZ7utBUGNXGVkcBebNlzNtFBccriY1WAwI8ThgIX
	dZdQ==
X-Gm-Message-State: ALoCoQm2Sa2wUs+EsYgrEfxVArUct3Y7aN9bK0FctgPxo54GTef7XQHHmrRtClr30+PDC01tmJW9
X-Received: by 10.60.39.65 with SMTP id n1mr28977361oek.31.1436772783946; Mon,
	13 Jul 2015 00:33:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Mon, 13 Jul 2015 00:32:34 -0700 (PDT)
In-Reply-To: <1436765669-1629-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <CAJTo0LYZttp-EUKvzTr9eysyqVyo2X+aPd7bDya8D-q9Gqk57Q@mail.gmail.com>
	<1436765669-1629-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 13 Jul 2015 10:32:34 +0300
Message-ID: <CAHiDW_FZL13XiintSje+9feoLcnqFoC+RkeuYWJ06EHh_qrcZA@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lighttpd: Fix mod_cgi to avoid it buffers data without bound.
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
X-List-Received-Date: Mon, 13 Jul 2015 07:33:07 -0000
Content-Type: text/plain; charset=UTF-8

On 13 July 2015 at 08:34, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> If there is a CGI that provides a continuous stream of data,
> if lighttpd client reads slower then the CGI is pushing the data,
> then lighttpd's buffers will grow until the (embedded) machine OOMs.
>
> Ref: http://redmine.lighttpd.net/issues/1264
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../0001-mod_cgi-buffers-data-without-bound.patch  | 389 +++++++++++++++++++++
>  meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb  |   1 +
>  2 files changed, 390 insertions(+)
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
> new file mode 100644
> index 0000000..c04f078
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without-bound.patch
> @@ -0,0 +1,389 @@
> +From e6ccbab5d42b110ac4f6ce1f72cb1e9ccbe4400a Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 16 Jun 2015 19:02:38 +0900
> +Subject: [PATCH] mod_cgi buffers data without bound so fix it
> +
> +Upstream-Status: Backport
> +it will be fixed in version 1.5.0

Is this really in an upstream branch somewhere? It's not clear from
the bug that it is (last updated 8 years ago, no comments from
lighttpd developers). If the patch is just taken from the bug report
then a "Upstream-Status: Submitted
[http://redmine.lighttpd.net/issues/1264]" would be more factual.

> +
> +Ref: http://redmine.lighttpd.net/issues/1264
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + doc/config/lighttpd.conf |   8 ++
> + src/mod_cgi.c            | 188 ++++++++++++++++++++++++++++++++++++++++++++---
> + 2 files changed, 186 insertions(+), 10 deletions(-)
> +
> +diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf
> +index 60b0ae1..9c101a7 100644
> +--- a/doc/config/lighttpd.conf
> ++++ b/doc/config/lighttpd.conf
> +@@ -375,6 +375,14 @@ server.upload-dirs = ( "/var/tmp" )
> + ##
> + #######################################################################
> +
> ++#######################################################################
> ++##
> ++##
> ++## maximum bytes in send_raw before backing off [KByte]
> ++##  cgi.high-waterlevel        = 10240
> ++## minimum bytes in send_raw to disable backoff [KByte]
> ++##  cgi.low-waterlevel         = 5120
> ++#######################################################################
> +
> + #######################################################################
> + ##
> +diff --git a/src/mod_cgi.c b/src/mod_cgi.c
> +index 734ecee..c51f43c 100644
> +--- a/src/mod_cgi.c
> ++++ b/src/mod_cgi.c
> +@@ -38,6 +38,10 @@
> +
> + #include "version.h"
> +
> ++/* for output logs */
> ++char msgbuf[2048];
> ++
> ++
> + enum {EOL_UNSET, EOL_N, EOL_RN};
> +
> + typedef struct {
> +@@ -53,9 +57,19 @@ typedef struct {
> +       size_t size;
> + } buffer_pid_t;
> +
> ++struct handler_ctx;
> ++
> ++typedef struct {
> ++      struct handler_ctx **hctx;
> ++      size_t used;
> ++      size_t size;
> ++} buffer_ctx_t;
> ++
> + typedef struct {
> +       array *cgi;
> +       unsigned short execute_x_only;
> ++      unsigned int high_waterlevel; /* maximum bytes in send_raw before backing off */
> ++      unsigned int low_waterlevel;  /* minimum bytes in send_raw to disable backoff */
> + } plugin_config;
> +
> + typedef struct {
> +@@ -68,9 +82,11 @@ typedef struct {
> +       plugin_config **config_storage;
> +
> +       plugin_config conf;
> ++
> ++      buffer_ctx_t cgi_ctx;
> + } plugin_data;
> +
> +-typedef struct {
> ++typedef struct handler_ctx {
> +       pid_t pid;
> +       int fd;
> +       int fde_ndx; /* index into the fd-event buffer */
> +@@ -78,11 +94,16 @@ typedef struct {
> +       connection *remote_conn;  /* dumb pointer */
> +       plugin_data *plugin_data; /* dumb pointer */
> +
> ++      int throttling;        /* 1=waiting for send_raw buffer to drain */
> ++      off_t high_waterlevel; /* maximum bytes in send_raw before backing off */
> ++      off_t low_waterlevel;  /* minimum bytes in send_raw to disable backoff */
> ++      off_t bytes_in_buffer;
> ++
> +       buffer *response;
> +       buffer *response_header;
> + } handler_ctx;
> +
> +-static handler_ctx * cgi_handler_ctx_init(void) {
> ++static handler_ctx * cgi_handler_ctx_init(plugin_data *p) {
> +       handler_ctx *hctx = calloc(1, sizeof(*hctx));
> +
> +       force_assert(hctx);
> +@@ -90,13 +111,26 @@ static handler_ctx * cgi_handler_ctx_init(void) {
> +       hctx->response = buffer_init();
> +       hctx->response_header = buffer_init();
> +
> ++      hctx->throttling = 0;
> ++      hctx->high_waterlevel = (off_t)p->conf.high_waterlevel * 1024;
> ++      hctx->low_waterlevel  = (off_t)p->conf.low_waterlevel  * 1024;
> ++      if (hctx->low_waterlevel >= hctx->high_waterlevel) {
> ++          hctx->low_waterlevel = hctx->high_waterlevel * 3 / 4; /* 75% */
> ++      }
> ++      hctx->bytes_in_buffer = 0;
> ++
> +       return hctx;
> + }
> +
> +-static void cgi_handler_ctx_free(handler_ctx *hctx) {
> ++static void cgi_handler_ctx_free(server *srv, handler_ctx *hctx) {
> +       buffer_free(hctx->response);
> +       buffer_free(hctx->response_header);
> +
> ++      /* to avoid confusion */
> ++      if (hctx->throttling) {
> ++          log_error_write(srv, __FILE__, __LINE__, "s", "unthrottled");
> ++      }
> ++
> +       free(hctx);
> + }
> +
> +@@ -152,6 +186,8 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
> +       config_values_t cv[] = {
> +               { "cgi.assign",                  NULL, T_CONFIG_ARRAY, T_CONFIG_SCOPE_CONNECTION },       /* 0 */
> +               { "cgi.execute-x-only",          NULL, T_CONFIG_BOOLEAN, T_CONFIG_SCOPE_CONNECTION },     /* 1 */
> ++              { "cgi.high-waterlevel",         NULL, T_CONFIG_INT,   T_CONFIG_SCOPE_CONNECTION },       /* 2 */
> ++              { "cgi.low-waterlevel",          NULL, T_CONFIG_INT,   T_CONFIG_SCOPE_CONNECTION },       /* 3 */
> +               { NULL,                          NULL, T_CONFIG_UNSET, T_CONFIG_SCOPE_UNSET}
> +       };
> +
> +@@ -167,9 +203,13 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
> +
> +               s->cgi    = array_init();
> +               s->execute_x_only = 0;
> ++              s->high_waterlevel = 0; /* 0 == disabled */
> ++              s->low_waterlevel  = 0;
> +
> +               cv[0].destination = s->cgi;
> +               cv[1].destination = &(s->execute_x_only);
> ++              cv[2].destination = &(s->high_waterlevel);
> ++              cv[3].destination = &(s->low_waterlevel);
> +
> +               p->config_storage[i] = s;
> +
> +@@ -182,6 +222,51 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
> + }
> +
> +
> ++static void cgi_recount_bytes_in_buffer(handler_ctx *hctx)
> ++{
> ++      chunkqueue *cq = hctx->remote_conn->write_queue;
> ++      hctx->bytes_in_buffer = chunkqueue_length(cq) - chunkqueue_written(cq);
> ++}
> ++
> ++
> ++static void cgi_throttling_control(server *srv, handler_ctx *hctx)
> ++{
> ++      cgi_recount_bytes_in_buffer(hctx);
> ++
> ++#ifdef DEBUG
> ++      sprintf(msgbuf, "throttling=%d, chars=%llu, high=%llu, low=%llu",
> ++              hctx->throttling, hctx->bytes_in_buffer,
> ++              hctx->high_waterlevel, hctx->low_waterlevel);
> ++      log_error_write(srv, __FILE__, __LINE__, "ss",
> ++                      "(debug) throttling control,", msgbuf);
> ++#endif
> ++
> ++      if (hctx->throttling) {
> ++              sprintf(msgbuf, "throttling; chars in queue=%llu,"
> ++                      " low-waterlevel=%llu, high-waterlevel=%llu",
> ++                      hctx->bytes_in_buffer,
> ++                      hctx->low_waterlevel, hctx->high_waterlevel);
> ++              log_error_write(srv, __FILE__, __LINE__, "s", msgbuf);
> ++              if (hctx->bytes_in_buffer <= hctx->low_waterlevel) {
> ++                      fdevent_event_set(srv->ev, &(hctx->fde_ndx), hctx->fd, FDEVENT_IN);
> ++                      hctx->throttling = 0;
> ++                      log_error_write(srv, __FILE__, __LINE__, "s", "unthrottled");
> ++              }
> ++      } else {
> ++              if (hctx->high_waterlevel != 0 &&
> ++                      hctx->high_waterlevel <= hctx->bytes_in_buffer) {
> ++                      fdevent_event_del(srv->ev, &(hctx->fde_ndx), hctx->fd);
> ++                      hctx->throttling = 1;
> ++                      sprintf(msgbuf, "throttled; chars in queue=%llu,"
> ++                              " low-waterlevel=%llu, high-waterlevel=%llu",
> ++                              hctx->bytes_in_buffer,
> ++                              hctx->low_waterlevel, hctx->high_waterlevel);
> ++                      log_error_write(srv, __FILE__, __LINE__, "s", msgbuf);
> ++              }
> ++      }
> ++}
> ++
> ++
> + static int cgi_pid_add(server *srv, plugin_data *p, pid_t pid) {
> +       int m = -1;
> +       size_t i;
> +@@ -228,6 +313,39 @@ static int cgi_pid_del(server *srv, plugin_data *p, pid_t pid) {
> +       return 0;
> + }
> +
> ++
> ++static void cgi_ctx_add(plugin_data *p, handler_ctx *hctx) {
> ++      buffer_ctx_t *r = &(p->cgi_ctx);
> ++
> ++      if (r->size == 0) {
> ++              r->size = 16;
> ++              r->hctx = malloc(sizeof(*r->hctx) * r->size);
> ++      } else if (r->used == r->size) {
> ++              r->size += 16;
> ++              r->hctx = realloc(r->hctx, sizeof(*r->hctx) * r->size);
> ++      }
> ++
> ++      r->hctx[r->used++] = hctx;
> ++}
> ++
> ++static void cgi_ctx_del(plugin_data *p, handler_ctx *hctx) {
> ++      size_t i;
> ++      buffer_ctx_t *r = &(p->cgi_ctx);
> ++
> ++      for (i = 0; i < r->used; i++) {
> ++              if (r->hctx[i] == hctx) break;
> ++      }
> ++
> ++      if (i != r->used) {
> ++              /* found */
> ++
> ++              if (i != r->used - 1) {
> ++                      r->hctx[i] = r->hctx[r->used - 1];
> ++              }
> ++              r->used--;
> ++      }
> ++}
> ++
> + static int cgi_response_parse(server *srv, connection *con, plugin_data *p, buffer *in) {
> +       char *ns;
> +       const char *s;
> +@@ -378,6 +496,13 @@ static int cgi_demux_response(server *srv, handler_ctx *hctx) {
> +
> +               hctx->response->ptr[n] = '\0';
> +               hctx->response->used = n+1;
> ++#ifdef DEBUG
> ++              sprintf(msgbuf, "n=%d, bytes_out=%llu, bytes_in=%llu", n,
> ++                      (unsigned long long)con->write_queue->bytes_out,
> ++                      (unsigned long long)con->write_queue->bytes_in);
> ++              log_error_write(srv, __FILE__, __LINE__, "ss",
> ++                              "(debug) read,", msgbuf);
> ++#endif
> +
> +               /* split header from body */
> +
> +@@ -502,8 +627,20 @@ static int cgi_demux_response(server *srv, handler_ctx *hctx) {
> +                       }
> +               } else {
> +                       http_chunk_append_mem(srv, con, hctx->response->ptr, hctx->response->used);
> ++#ifdef DEBUG
> ++                      sprintf(msgbuf, "n=%d, bytes_out=%llu, bytes_in=%llu, limit=%llu", n,
> ++                              (unsigned long long)con->write_queue->bytes_out,
> ++                              (unsigned long long)con->write_queue->bytes_in,
> ++                              (unsigned long long)hctx->high_waterlevel);
> ++                      log_error_write(srv, __FILE__, __LINE__,
> ++                                      "ss", "(debug) append,", msgbuf);
> ++#endif
> +                       joblist_append(srv, con);
> +-              }
> ++                      cgi_throttling_control(srv, hctx);
> ++                      if (hctx->throttling) {
> ++                              return FDEVENT_HANDLED_NOT_FINISHED;
> ++                      }
> ++              }
> +
> + #if 0
> +               log_error_write(srv, __FILE__, __LINE__, "ddss", con->fd, hctx->fd, connection_get_state(con->state), b->ptr);
> +@@ -552,8 +689,9 @@ static handler_t cgi_connection_close(server *srv, handler_ctx *hctx) {
> +       con->plugin_ctx[p->id] = NULL;
> +
> +       /* is this a good idea ? */
> +-      cgi_handler_ctx_free(hctx);
> +-
> ++      cgi_ctx_del(p, hctx);
> ++      cgi_handler_ctx_free(srv, hctx);
> ++
> +       /* if waitpid hasn't been called by response.c yet, do it here */
> +       if (pid) {
> +               /* check if the CGI-script is already gone */
> +@@ -1156,7 +1294,8 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
> +               con->mode = p->id;
> +               buffer_reset(con->physical.path);
> +
> +-              hctx = cgi_handler_ctx_init();
> ++              hctx = cgi_handler_ctx_init(p);
> ++              cgi_ctx_add(p, hctx);
> +
> +               hctx->remote_conn = con;
> +               hctx->plugin_data = p;
> +@@ -1165,6 +1304,11 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
> +               hctx->fde_ndx = -1;
> +
> +               con->plugin_ctx[p->id] = hctx;
> ++#ifdef DEBUG
> ++              sprintf(msgbuf, "hctx=%p, con=%p", (void*)hctx, (void*)con);
> ++              log_error_write(srv, __FILE__, __LINE__, "ss",
> ++                              "(debug) hctx generated, ", msgbuf);
> ++#endif
> +
> +               fdevent_register(srv->ev, hctx->fd, cgi_handle_fdevent, hctx);
> +               fdevent_event_set(srv->ev, &(hctx->fde_ndx), hctx->fd, FDEVENT_IN);
> +@@ -1179,7 +1323,8 @@ static int cgi_create_env(server *srv, connection *con, plugin_data *p, buffer *
> +
> +                       close(hctx->fd);
> +
> +-                      cgi_handler_ctx_free(hctx);
> ++                      cgi_ctx_del(p, hctx);
> ++                      cgi_handler_ctx_free(srv, hctx);
> +
> +                       con->plugin_ctx[p->id] = NULL;
> +
> +@@ -1204,6 +1349,8 @@ static int mod_cgi_patch_connection(server *srv, connection *con, plugin_data *p
> +
> +       PATCH(cgi);
> +       PATCH(execute_x_only);
> ++      PATCH(high_waterlevel);
> ++      PATCH(low_waterlevel);
> +
> +       /* skip the first, the global context */
> +       for (i = 1; i < srv->config_context->used; i++) {
> +@@ -1221,6 +1368,10 @@ static int mod_cgi_patch_connection(server *srv, connection *con, plugin_data *p
> +                               PATCH(cgi);
> +                       } else if (buffer_is_equal_string(du->key, CONST_STR_LEN("cgi.execute-x-only"))) {
> +                               PATCH(execute_x_only);
> ++                      } else if (buffer_is_equal_string(du->key, CONST_STR_LEN("cgi.high-waterlevel"))) {
> ++                              PATCH(high_waterlevel);
> ++                      } else if (buffer_is_equal_string(du->key, CONST_STR_LEN("cgi.low-waterlevel"))) {
> ++                              PATCH(low_waterlevel);
> +                       }
> +               }
> +       }
> +@@ -1273,6 +1424,21 @@ URIHANDLER_FUNC(cgi_is_handled) {
> + TRIGGER_FUNC(cgi_trigger) {
> +       plugin_data *p = p_d;
> +       size_t ndx;
> ++
> ++      for (ndx = 0; ndx < p->cgi_ctx.used; ndx++) {
> ++              handler_ctx *hctx = p->cgi_ctx.hctx[ndx];
> ++#ifdef DEBUG
> ++              connection *con = hctx->remote_conn;
> ++
> ++              sprintf(msgbuf, "hctx=%p, con=%p, bytes_in_buffer=%llu",
> ++                      (void*)hctx, (void*)con,
> ++                      (unsigned long long)hctx->bytes_in_buffer);
> ++              log_error_write(srv, __FILE__, __LINE__, "ss",
> ++                              "(debug) found using ctx,", msgbuf);
> ++#endif
> ++              cgi_throttling_control(srv, hctx);
> ++      }
> ++
> +       /* the trigger handle only cares about lonely PID which we have to wait for */
> + #ifndef __WIN32
> +
> +@@ -1381,7 +1547,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
> +                       log_error_write(srv, __FILE__, __LINE__, "sds", "cgi close failed ", hctx->fd, strerror(errno));
> +               }
> +
> +-              cgi_handler_ctx_free(hctx);
> ++              cgi_ctx_del(p, hctx);
> ++              cgi_handler_ctx_free(srv, hctx);
> +
> +               con->plugin_ctx[p->id] = NULL;
> +
> +@@ -1413,7 +1580,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
> +                       log_error_write(srv, __FILE__, __LINE__, "sds", "cgi close failed ", hctx->fd, strerror(errno));
> +               }
> +
> +-              cgi_handler_ctx_free(hctx);
> ++              cgi_ctx_del(p, hctx);
> ++              cgi_handler_ctx_free(srv, hctx);
> +
> +               con->plugin_ctx[p->id] = NULL;
> +               return HANDLER_FINISHED;
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> index 0cf5aa2..d3888e6 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> @@ -24,6 +24,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
>          file://lighttpd \
>          file://lighttpd.service \
>          file://pkgconfig.patch \
> +        file://0001-mod_cgi-buffers-data-without-bound.patch \
>          "
>
>  SRC_URI[md5sum] = "f7a88130ee9984b421ad8aa80629750a"
> --
> 1.8.4.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


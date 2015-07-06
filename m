Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EEC1275D86
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 10:12:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98120941"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jul 2015 18:16:47 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t66ABAfN019564
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 18:11:10 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Mon, 6 Jul 2015 18:12:52 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] lighttpd: Bug fix
Thread-Index: AQHQqJ3ey1P0kwWFSESUMkTBh+nv+J3OV0gQ
Date: Mon, 6 Jul 2015 10:12:51 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87390C891@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1434504886-4212-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1434504886-4212-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [PATCH] lighttpd: Bug fix
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
X-List-Received-Date: Mon, 06 Jul 2015 10:12:54 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Ping...

Regards

Li
> -----Original Message-----
> From: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Sent: Wednesday, June 17, 2015 9:35 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Subject: [OE-core][PATCH] lighttpd: Bug fix
>=20
> mod_cgi buffers data without bound,so fix it.
>=20
> Reference: http://redmine.lighttpd.net/issues/1264
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../0001-mod_cgi-buffers-data-without-bound.patch  | 386
> +++++++++++++++++++++
>  meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb  |   1 +
>  2 files changed, 387 insertions(+)
>  create mode 100644
> meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-without=
-boun
> d.patch
>=20
> diff --git
> a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-witho=
ut-bo
> und.patch
> b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-witho=
ut-bo
> und.patch
> new file mode 100644
> index 0000000..e456182
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_cgi-buffers-data-
> +++ without-bound.patch
> @@ -0,0 +1,386 @@
> +From e6ccbab5d42b110ac4f6ce1f72cb1e9ccbe4400a Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 16 Jun 2015 19:02:38 +0900
> +Subject: [PATCH] mod_cgi buffers data without bound so fix it
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + doc/config/lighttpd.conf |   8 ++
> + src/mod_cgi.c            | 188
> ++++++++++++++++++++++++++++++++++++++++++++---
> + 2 files changed, 186 insertions(+), 10 deletions(-)
> +
> +diff --git a/doc/config/lighttpd.conf b/doc/config/lighttpd.conf index
> +60b0ae1..9c101a7 100644
> +--- a/doc/config/lighttpd.conf
> ++++ b/doc/config/lighttpd.conf
> +@@ -375,6 +375,14 @@ server.upload-dirs =3D ( "/var/tmp" )  ##
> +##################################################################
> #####
> +
> ++#################################################################
> #####
> ++#
> ++##
> ++##
> ++## maximum bytes in send_raw before backing off [KByte]
> ++##  cgi.high-waterlevel        =3D 10240
> ++## minimum bytes in send_raw to disable backoff [KByte]
> ++##  cgi.low-waterlevel         =3D 5120
> ++#################################################################
> #####
> ++#
> +
> +
> +##################################################################
> #####
> + ##
> +diff --git a/src/mod_cgi.c b/src/mod_cgi.c index 734ecee..c51f43c
> +100644
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
> + 	size_t size;
> + } buffer_pid_t;
> +
> ++struct handler_ctx;
> ++
> ++typedef struct {
> ++	struct handler_ctx **hctx;
> ++	size_t used;
> ++	size_t size;
> ++} buffer_ctx_t;
> ++
> + typedef struct {
> + 	array *cgi;
> + 	unsigned short execute_x_only;
> ++	unsigned int high_waterlevel; /* maximum bytes in send_raw before back=
ing
> off */
> ++	unsigned int low_waterlevel;  /* minimum bytes in send_raw to disable
> ++backoff */
> + } plugin_config;
> +
> + typedef struct {
> +@@ -68,9 +82,11 @@ typedef struct {
> + 	plugin_config **config_storage;
> +
> + 	plugin_config conf;
> ++
> ++	buffer_ctx_t cgi_ctx;
> + } plugin_data;
> +
> +-typedef struct {
> ++typedef struct handler_ctx {
> + 	pid_t pid;
> + 	int fd;
> + 	int fde_ndx; /* index into the fd-event buffer */ @@ -78,11 +94,16 @@
> +typedef struct {
> + 	connection *remote_conn;  /* dumb pointer */
> + 	plugin_data *plugin_data; /* dumb pointer */
> +
> ++	int throttling;        /* 1=3Dwaiting for send_raw buffer to drain */
> ++	off_t high_waterlevel; /* maximum bytes in send_raw before backing off=
 */
> ++	off_t low_waterlevel;  /* minimum bytes in send_raw to disable backoff=
 */
> ++	off_t bytes_in_buffer;
> ++
> + 	buffer *response;
> + 	buffer *response_header;
> + } handler_ctx;
> +
> +-static handler_ctx * cgi_handler_ctx_init(void) {
> ++static handler_ctx * cgi_handler_ctx_init(plugin_data *p) {
> + 	handler_ctx *hctx =3D calloc(1, sizeof(*hctx));
> +
> + 	force_assert(hctx);
> +@@ -90,13 +111,26 @@ static handler_ctx * cgi_handler_ctx_init(void) {
> + 	hctx->response =3D buffer_init();
> + 	hctx->response_header =3D buffer_init();
> +
> ++	hctx->throttling =3D 0;
> ++	hctx->high_waterlevel =3D (off_t)p->conf.high_waterlevel * 1024;
> ++	hctx->low_waterlevel  =3D (off_t)p->conf.low_waterlevel  * 1024;
> ++	if (hctx->low_waterlevel >=3D hctx->high_waterlevel) {
> ++	    hctx->low_waterlevel =3D hctx->high_waterlevel * 3 / 4; /* 75% */
> ++	}
> ++	hctx->bytes_in_buffer =3D 0;
> ++
> + 	return hctx;
> + }
> +
> +-static void cgi_handler_ctx_free(handler_ctx *hctx) {
> ++static void cgi_handler_ctx_free(server *srv, handler_ctx *hctx) {
> + 	buffer_free(hctx->response);
> + 	buffer_free(hctx->response_header);
> +
> ++	/* to avoid confusion */
> ++	if (hctx->throttling) {
> ++	    log_error_write(srv, __FILE__, __LINE__, "s", "unthrottled");
> ++	}
> ++
> + 	free(hctx);
> + }
> +
> +@@ -152,6 +186,8 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
> + 	config_values_t cv[] =3D {
> + 		{ "cgi.assign",                  NULL, T_CONFIG_ARRAY,
> T_CONFIG_SCOPE_CONNECTION },       /* 0 */
> + 		{ "cgi.execute-x-only",          NULL, T_CONFIG_BOOLEAN,
> T_CONFIG_SCOPE_CONNECTION },     /* 1 */
> ++		{ "cgi.high-waterlevel",         NULL, T_CONFIG_INT,
> T_CONFIG_SCOPE_CONNECTION },       /* 2 */
> ++		{ "cgi.low-waterlevel",          NULL, T_CONFIG_INT,
> T_CONFIG_SCOPE_CONNECTION },       /* 3 */
> + 		{ NULL,                          NULL, T_CONFIG_UNSET,
> T_CONFIG_SCOPE_UNSET}
> + 	};
> +
> +@@ -167,9 +203,13 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {
> +
> + 		s->cgi    =3D array_init();
> + 		s->execute_x_only =3D 0;
> ++		s->high_waterlevel =3D 0; /* 0 =3D=3D disabled */
> ++		s->low_waterlevel  =3D 0;
> +
> + 		cv[0].destination =3D s->cgi;
> + 		cv[1].destination =3D &(s->execute_x_only);
> ++		cv[2].destination =3D &(s->high_waterlevel);
> ++		cv[3].destination =3D &(s->low_waterlevel);
> +
> + 		p->config_storage[i] =3D s;
> +
> +@@ -182,6 +222,51 @@ SETDEFAULTS_FUNC(mod_fastcgi_set_defaults) {  }
> +
> +
> ++static void cgi_recount_bytes_in_buffer(handler_ctx *hctx) {
> ++	chunkqueue *cq =3D hctx->remote_conn->write_queue;
> ++	hctx->bytes_in_buffer =3D chunkqueue_length(cq) -
> ++chunkqueue_written(cq); }
> ++
> ++
> ++static void cgi_throttling_control(server *srv, handler_ctx *hctx) {
> ++	cgi_recount_bytes_in_buffer(hctx);
> ++
> ++#ifdef DEBUG
> ++	sprintf(msgbuf, "throttling=3D%d, chars=3D%llu, high=3D%llu, low=3D%ll=
u",
> ++		hctx->throttling, hctx->bytes_in_buffer,
> ++		hctx->high_waterlevel, hctx->low_waterlevel);
> ++	log_error_write(srv, __FILE__, __LINE__, "ss",
> ++			"(debug) throttling control,", msgbuf); #endif
> ++
> ++	if (hctx->throttling) {
> ++		sprintf(msgbuf, "throttling; chars in queue=3D%llu,"
> ++			" low-waterlevel=3D%llu, high-waterlevel=3D%llu",
> ++			hctx->bytes_in_buffer,
> ++			hctx->low_waterlevel, hctx->high_waterlevel);
> ++		log_error_write(srv, __FILE__, __LINE__, "s", msgbuf);
> ++		if (hctx->bytes_in_buffer <=3D hctx->low_waterlevel) {
> ++			fdevent_event_set(srv->ev, &(hctx->fde_ndx), hctx->fd,
> FDEVENT_IN);
> ++			hctx->throttling =3D 0;
> ++			log_error_write(srv, __FILE__, __LINE__, "s", "unthrottled");
> ++		}
> ++	} else {
> ++		if (hctx->high_waterlevel !=3D 0 &&
> ++			hctx->high_waterlevel <=3D hctx->bytes_in_buffer) {
> ++			fdevent_event_del(srv->ev, &(hctx->fde_ndx), hctx->fd);
> ++			hctx->throttling =3D 1;
> ++			sprintf(msgbuf, "throttled; chars in queue=3D%llu,"
> ++				" low-waterlevel=3D%llu, high-waterlevel=3D%llu",
> ++				hctx->bytes_in_buffer,
> ++				hctx->low_waterlevel, hctx->high_waterlevel);
> ++			log_error_write(srv, __FILE__, __LINE__, "s", msgbuf);
> ++		}
> ++	}
> ++}
> ++
> ++
> + static int cgi_pid_add(server *srv, plugin_data *p, pid_t pid) {
> + 	int m =3D -1;
> + 	size_t i;
> +@@ -228,6 +313,39 @@ static int cgi_pid_del(server *srv, plugin_data *p,=
 pid_t
> pid) {
> + 	return 0;
> + }
> +
> ++
> ++static void cgi_ctx_add(plugin_data *p, handler_ctx *hctx) {
> ++	buffer_ctx_t *r =3D &(p->cgi_ctx);
> ++
> ++	if (r->size =3D=3D 0) {
> ++		r->size =3D 16;
> ++		r->hctx =3D malloc(sizeof(*r->hctx) * r->size);
> ++	} else if (r->used =3D=3D r->size) {
> ++		r->size +=3D 16;
> ++		r->hctx =3D realloc(r->hctx, sizeof(*r->hctx) * r->size);
> ++	}
> ++
> ++	r->hctx[r->used++] =3D hctx;
> ++}
> ++
> ++static void cgi_ctx_del(plugin_data *p, handler_ctx *hctx) {
> ++	size_t i;
> ++	buffer_ctx_t *r =3D &(p->cgi_ctx);
> ++
> ++	for (i =3D 0; i < r->used; i++) {
> ++		if (r->hctx[i] =3D=3D hctx) break;
> ++	}
> ++
> ++	if (i !=3D r->used) {
> ++		/* found */
> ++
> ++		if (i !=3D r->used - 1) {
> ++			r->hctx[i] =3D r->hctx[r->used - 1];
> ++		}
> ++		r->used--;
> ++	}
> ++}
> ++
> + static int cgi_response_parse(server *srv, connection *con, plugin_data=
 *p,
> buffer *in) {
> + 	char *ns;
> + 	const char *s;
> +@@ -378,6 +496,13 @@ static int cgi_demux_response(server *srv,
> +handler_ctx *hctx) {
> +
> + 		hctx->response->ptr[n] =3D '\0';
> + 		hctx->response->used =3D n+1;
> ++#ifdef DEBUG
> ++		sprintf(msgbuf, "n=3D%d, bytes_out=3D%llu, bytes_in=3D%llu", n,
> ++			(unsigned long long)con->write_queue->bytes_out,
> ++			(unsigned long long)con->write_queue->bytes_in);
> ++		log_error_write(srv, __FILE__, __LINE__, "ss",
> ++				"(debug) read,", msgbuf);
> ++#endif
> +
> + 		/* split header from body */
> +
> +@@ -502,8 +627,20 @@ static int cgi_demux_response(server *srv, handler_=
ctx
> *hctx) {
> + 			}
> + 		} else {
> + 			http_chunk_append_mem(srv, con, hctx->response->ptr,
> +hctx->response->used);
> ++#ifdef DEBUG
> ++			sprintf(msgbuf, "n=3D%d, bytes_out=3D%llu, bytes_in=3D%llu, limit=3D=
%llu",
> n,
> ++				(unsigned long long)con->write_queue->bytes_out,
> ++				(unsigned long long)con->write_queue->bytes_in,
> ++				(unsigned long long)hctx->high_waterlevel);
> ++			log_error_write(srv, __FILE__, __LINE__,
> ++					"ss", "(debug) append,", msgbuf); #endif
> + 			joblist_append(srv, con);
> +-		}
> ++			cgi_throttling_control(srv, hctx);
> ++			if (hctx->throttling) {
> ++				return FDEVENT_HANDLED_NOT_FINISHED;
> ++			}
> ++		}
> +
> + #if 0
> + 		log_error_write(srv, __FILE__, __LINE__, "ddss", con->fd, hctx->fd,
> +connection_get_state(con->state), b->ptr); @@ -552,8 +689,9 @@ static
> handler_t cgi_connection_close(server *srv, handler_ctx *hctx) {
> + 	con->plugin_ctx[p->id] =3D NULL;
> +
> + 	/* is this a good idea ? */
> +-	cgi_handler_ctx_free(hctx);
> +-
> ++	cgi_ctx_del(p, hctx);
> ++	cgi_handler_ctx_free(srv, hctx);
> ++
> + 	/* if waitpid hasn't been called by response.c yet, do it here */
> + 	if (pid) {
> + 		/* check if the CGI-script is already gone */ @@ -1156,7 +1294,8 @@
> +static int cgi_create_env(server *srv, connection *con, plugin_data *p, =
buffer *
> + 		con->mode =3D p->id;
> + 		buffer_reset(con->physical.path);
> +
> +-		hctx =3D cgi_handler_ctx_init();
> ++		hctx =3D cgi_handler_ctx_init(p);
> ++		cgi_ctx_add(p, hctx);
> +
> + 		hctx->remote_conn =3D con;
> + 		hctx->plugin_data =3D p;
> +@@ -1165,6 +1304,11 @@ static int cgi_create_env(server *srv, connection=
 *con,
> plugin_data *p, buffer *
> + 		hctx->fde_ndx =3D -1;
> +
> + 		con->plugin_ctx[p->id] =3D hctx;
> ++#ifdef DEBUG
> ++		sprintf(msgbuf, "hctx=3D%p, con=3D%p", (void*)hctx, (void*)con);
> ++		log_error_write(srv, __FILE__, __LINE__, "ss",
> ++				"(debug) hctx generated, ", msgbuf); #endif
> +
> + 		fdevent_register(srv->ev, hctx->fd, cgi_handle_fdevent, hctx);
> + 		fdevent_event_set(srv->ev, &(hctx->fde_ndx), hctx->fd, FDEVENT_IN);
> +@@ -1179,7 +1323,8 @@ static int cgi_create_env(server *srv, connection
> +*con, plugin_data *p, buffer *
> +
> + 			close(hctx->fd);
> +
> +-			cgi_handler_ctx_free(hctx);
> ++			cgi_ctx_del(p, hctx);
> ++			cgi_handler_ctx_free(srv, hctx);
> +
> + 			con->plugin_ctx[p->id] =3D NULL;
> +
> +@@ -1204,6 +1349,8 @@ static int mod_cgi_patch_connection(server *srv,
> +connection *con, plugin_data *p
> +
> + 	PATCH(cgi);
> + 	PATCH(execute_x_only);
> ++	PATCH(high_waterlevel);
> ++	PATCH(low_waterlevel);
> +
> + 	/* skip the first, the global context */
> + 	for (i =3D 1; i < srv->config_context->used; i++) { @@ -1221,6 +1368,1=
0
> +@@ static int mod_cgi_patch_connection(server *srv, connection *con,
> plugin_data *p
> + 				PATCH(cgi);
> + 			} else if (buffer_is_equal_string(du->key,
> CONST_STR_LEN("cgi.execute-x-only"))) {
> + 				PATCH(execute_x_only);
> ++			} else if (buffer_is_equal_string(du->key,
> CONST_STR_LEN("cgi.high-waterlevel"))) {
> ++				PATCH(high_waterlevel);
> ++			} else if (buffer_is_equal_string(du->key,
> CONST_STR_LEN("cgi.low-waterlevel"))) {
> ++				PATCH(low_waterlevel);
> + 			}
> + 		}
> + 	}
> +@@ -1273,6 +1424,21 @@ URIHANDLER_FUNC(cgi_is_handled) {
> + TRIGGER_FUNC(cgi_trigger) {
> + 	plugin_data *p =3D p_d;
> + 	size_t ndx;
> ++
> ++	for (ndx =3D 0; ndx < p->cgi_ctx.used; ndx++) {
> ++		handler_ctx *hctx =3D p->cgi_ctx.hctx[ndx]; #ifdef DEBUG
> ++		connection *con =3D hctx->remote_conn;
> ++
> ++		sprintf(msgbuf, "hctx=3D%p, con=3D%p, bytes_in_buffer=3D%llu",
> ++			(void*)hctx, (void*)con,
> ++			(unsigned long long)hctx->bytes_in_buffer);
> ++		log_error_write(srv, __FILE__, __LINE__, "ss",
> ++				"(debug) found using ctx,", msgbuf); #endif
> ++		cgi_throttling_control(srv, hctx);
> ++	}
> ++
> + 	/* the trigger handle only cares about lonely PID which we have to
> + wait for */ #ifndef __WIN32
> +
> +@@ -1381,7 +1547,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
> + 			log_error_write(srv, __FILE__, __LINE__, "sds", "cgi close failed ",
> hctx->fd, strerror(errno));
> + 		}
> +
> +-		cgi_handler_ctx_free(hctx);
> ++		cgi_ctx_del(p, hctx);
> ++		cgi_handler_ctx_free(srv, hctx);
> +
> + 		con->plugin_ctx[p->id] =3D NULL;
> +
> +@@ -1413,7 +1580,8 @@ SUBREQUEST_FUNC(mod_cgi_handle_subrequest) {
> + 			log_error_write(srv, __FILE__, __LINE__, "sds", "cgi close failed ",
> hctx->fd, strerror(errno));
> + 		}
> +
> +-		cgi_handler_ctx_free(hctx);
> ++		cgi_ctx_del(p, hctx);
> ++		cgi_handler_ctx_free(srv, hctx);
> +
> + 		con->plugin_ctx[p->id] =3D NULL;
> + 		return HANDLER_FINISHED;
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> index 0cf5aa2..d3888e6 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D
> "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
>          file://lighttpd \
>          file://lighttpd.service \
>          file://pkgconfig.patch \
> +        file://0001-mod_cgi-buffers-data-without-bound.patch \
>          "
>=20
>  SRC_URI[md5sum] =3D "f7a88130ee9984b421ad8aa80629750a"
> --
> 1.8.4.2



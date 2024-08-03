Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6829BC52D6F
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 21:14:05 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.16380.1722719644247946599
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Aug 2024 14:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jQgyBreG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD61F1BF204;
	Sat,  3 Aug 2024 21:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722719642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zwp1zaVf5B+EIakeGgfR8KoBwjNEtkwcaHIzJXmQgEM=;
	b=jQgyBreGT+078Cikn+ll4YVOaY/aSem4+AGU0JMvgv0Ctu1t6ouA6LcplkyAEJTugqNLuu
	+f5OoTL4uD5qZ7b4vPEGb0oev65yG4qTnGB0qcd/nU6RApuKBt4U38mxbvan1oBnvmDSZH
	TRUFAoGO7ee2OHR/996Cl+U9vdcry8RpXgfg6QKtl1vh9rXdcEt+8Q5reH6uZ06A6/SUcG
	YUyP7oVLuNmxq/C/6Julnv6oqGIz1EtYkOo0ZidyAtFzFAXOMKjXro8758yUUuBF7Tetw7
	JnrvblikzxwP+HWyL3FmJ+wd2SdExPhi4C8kVVE32HibVVQnwjV2XMsTEeRZzQ==
Date: Sat, 3 Aug 2024 23:14:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: li.wang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [openembedded-core V3][master][PATCH]xinetd: use
 monotonic time
Message-ID: <20240803211401f027b38c@mail.local>
References: <20240731022935.1745228-1-li.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731022935.1745228-1-li.wang@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Aug 2024 21:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202938

This fails to build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6251/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9164/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9344/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9332/steps/12/logs/stdio


On 31/07/2024 10:29:35+0800, Li Wang via lists.openembedded.org wrote:
> when using xinet.d to limit rsync connections and time is set back,
> the connection limit is reached very quickly and rsync gets deactivated,
> if time is changed again, rsync is never reactivated.
> 
> date -s "xxx"
> xinetd[xxx]: Deactivating service rsync due to excessive incoming connections. Restarting in 10 seconds.
> 
> the timer of xinet.d is based on time() function, and it is affected by system time.
> 
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
>  .../xinetd/xinetd/use-monotonic-time.patch    | 246 ++++++++++++++++++
>  .../xinetd/xinetd_2.3.15.4.bb                 |   1 +
>  2 files changed, 247 insertions(+)
>  create mode 100644 meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> 
> diff --git a/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> new file mode 100644
> index 0000000000..2144c3cba2
> --- /dev/null
> +++ b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> @@ -0,0 +1,246 @@
> +use monotonic time
> +
> +when using xinet.d to limit rsync connections and time is set back,
> +the connection limit is reached very quickly and rsync gets deactivated,
> +if time is changed again, rsync is never reactivated.
> +
> +date -s "xxx"
> +xinetd[xxx]: Deactivating service rsync due to excessive incoming connections. Restarting in 10 seconds.
> +
> +the timer of xinet.d is based on time() function, and it is affected by system time.
> +
> +Upstream-Status: Submitted [https://github.com/openSUSE/xinetd/pull/45]
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>
> +---
> + src/access.c       |    6 +++---
> + src/builtins.c     |    4 ++--
> + src/internals.c    |    2 +-
> + src/log.c          |    2 +-
> + src/sensor.c       |    6 +++---
> + src/server.c       |    2 +-
> + src/service.c      |    4 ++--
> + src/signals.c      |    2 +-
> + src/time.c         |    2 +-
> + src/xlog/filelog.c |    2 +-
> + src/xtimer.c       |   15 ++++++++++++---
> + src/xtimer.h       |    1 +
> + 12 files changed, 29 insertions(+), 19 deletions(-)
> +
> +--- a/src/access.c
> ++++ b/src/access.c
> +@@ -70,7 +70,7 @@ static void cps_service_restart(void)
> +    time_t nowtime;
> +    const char *func = "cps_service_restart";
> + 
> +-   nowtime = time(NULL);
> ++   nowtime = _time(NULL);
> +    for( i=0; i < pset_count( SERVICES(ps) ); i++ ) {
> +       struct service *sp;
> +       struct service_config *scp;
> +@@ -104,7 +104,7 @@ void cps_service_stop(struct service *sp
> +    msg(LOG_ERR, "service_stop", 
> + 	"Deactivating service %s due to %s.  Restarting in %d seconds.", 
> + 	SC_NAME(scp), reason, (int)SC_TIME_WAIT(scp));
> +-   nowtime = time(NULL);
> ++   nowtime = _time(NULL);
> +    SC_TIME_REENABLE(scp) = nowtime + SC_TIME_WAIT(scp);
> +    xtimer_add(cps_service_restart, SC_TIME_WAIT(scp));
> + }
> +@@ -284,7 +284,7 @@ access_e parent_access_control( struct s
> +    /* CPS handler */
> +    if( SC_TIME_CONN_MAX(scp) != 0 ) {
> +       int time_diff;
> +-      nowtime = time(NULL);
> ++      nowtime = _time(NULL);
> +       time_diff = nowtime - SC_TIME_LIMIT(scp) ;
> + 
> +       if( SC_TIME_CONN(scp) == 0 ) {
> +--- a/src/builtins.c
> ++++ b/src/builtins.c
> +@@ -237,7 +237,7 @@ static void daytime_protocol( char *buf,
> +    int         size = *buflen ;
> +    int      cc ;
> + 
> +-   (void) time( &now ) ;
> ++   (void) _time( &now ) ;
> +    tmp = localtime( &now ) ;
> +    cc = strx_nprint( buf, size,
> +       "%02d %s %d %02d:%02d:%02d",
> +@@ -308,7 +308,7 @@ static void time_protocol( unsigned char
> +    time_t now ;
> +    unsigned long base1900;
> + 
> +-   (void) time( &now ) ;
> ++   (void) _time( &now ) ;
> +    base1900 = (unsigned long)now + TIME_OFFSET ;
> +    timep[0] = base1900 >> 24;
> +    timep[1] = base1900 >> 16;
> +--- a/src/internals.c
> ++++ b/src/internals.c
> +@@ -85,7 +85,7 @@ void dump_internal_state(void)
> +     * Print the program name, version, and timestamp.
> +     * Note that the program_version variable contains the program name.
> +     */
> +-   (void) time( &current_time ) ;
> ++   (void) _time( &current_time ) ;
> +    Sprint( dump_fd, "INTERNAL STATE DUMP: %s\n", program_version ) ;
> +    Sprint( dump_fd, "Current time: %s\n", ctime( &current_time ) ) ;
> + 
> +--- a/src/log.c
> ++++ b/src/log.c
> +@@ -202,7 +202,7 @@ void svc_log_exit( struct service *sp, c
> +    {
> +       time_t current_time ;
> + 
> +-      (void) time( &current_time ) ;
> ++      (void) _time( &current_time ) ;
> +       cc = strx_nprint( &buf[ len ], bufsize, " duration=%ld(sec)",
> +          (long)(current_time - SERVER_STARTTIME( serp )) ) ;
> +       len += cc ;
> +--- a/src/sensor.c
> ++++ b/src/sensor.c
> +@@ -68,7 +68,7 @@ void process_sensor( const struct servic
> +                time_t nowtime;
> +                char time_buf[40], *tmp;
> + 
> +-	       nowtime = time(NULL);
> ++	       nowtime = _time(NULL);
> + 	       msg(LOG_CRIT, func,
> + 	           "Adding %s to the global_no_access list for %d minutes",
> + 	            dup_addr, SC_DENY_TIME(SVC_CONF(sp)));
> +@@ -113,7 +113,7 @@ void process_sensor( const struct servic
> +                {
> +                   time_t nowtime, new_time;
> + 
> +-                  nowtime = time(NULL);
> ++                  nowtime = _time(NULL);
> +                   new_time = (time_t)nowtime+(60*SC_DENY_TIME(SVC_CONF(sp)));                     if (difftime(new_time, (time_t)stored_time) > 0.0)
> + 	          {   /* new_time is longer save it   */
> + 		     char time_buf[40], *new_exp_time;
> +@@ -163,7 +163,7 @@ static void scrub_global_access_list( vo
> +    {
> +       int found_one = 0;
> +       unsigned u;
> +-      time_t nowtime = time(NULL);
> ++      time_t nowtime = _time(NULL);
> + 
> +       for (u=0; u < count; u++)
> +       {
> +--- a/src/server.c
> ++++ b/src/server.c
> +@@ -228,7 +228,7 @@ status_e server_start( struct server *se
> +          return( FAILED ) ;
> + 
> +       default:
> +-         (void) time( &SERVER_STARTTIME(serp) ) ;
> ++         (void) _time( &SERVER_STARTTIME(serp) ) ;
> +          SVC_INC_RUNNING_SERVERS( sp ) ;
> + 
> +          /*
> +--- a/src/service.c
> ++++ b/src/service.c
> +@@ -840,7 +840,7 @@ static status_e failed_service(struct se
> + 	       SVC_LAST_DGRAM_ADDR(sp) = (union xsockaddr *)last;
> +             }
> + 
> +-            (void) time( &current_time ) ;
> ++            (void) _time( &current_time ) ;
> +             if ( sinp->sin_addr.s_addr == last->sin_addr.s_addr &&
> +                                           sinp->sin_port == last->sin_port )
> +             {
> +@@ -867,7 +867,7 @@ static status_e failed_service(struct se
> + 	       SVC_LAST_DGRAM_ADDR( sp ) = (union xsockaddr *)last;
> +             }
> + 
> +-            (void) time( &current_time ) ;
> ++            (void) _time( &current_time ) ;
> +             if ( IN6_ARE_ADDR_EQUAL(&(sinp->sin6_addr), &(last->sin6_addr)) && 
> +                  sinp->sin6_port == last->sin6_port )
> +             {
> +--- a/src/signals.c
> ++++ b/src/signals.c
> +@@ -301,7 +301,7 @@ static void bad_signal(void)
> +    else if ( total_signal_count > MAX_SIGNAL_COUNT )
> +       _exit( 1 ) ;      /* in case of a problem in exit(3) */
> +    
> +-   (void) time( &current_time ) ;
> ++   (void) _time( &current_time ) ;
> + 
> +    if ( interval_signal_count > 0 &&
> +             current_time - interval_start <= SIGNAL_INTERVAL )
> +--- a/src/time.c
> ++++ b/src/time.c
> +@@ -41,7 +41,7 @@ bool_int ti_current_time_check( const ps
> +    int16_t     min_current ;
> +    struct tm   *tmp ;
> + 
> +-   (void) time( &current_time ) ;
> ++   (void) _time( &current_time ) ;
> +    tmp = localtime( &current_time ) ;
> +    min_current = tmp->tm_hour * 60 + tmp->tm_min ;
> + 
> +--- a/src/xlog/filelog.c
> ++++ b/src/xlog/filelog.c
> +@@ -190,7 +190,7 @@ static int filelog_write( xlog_s *xp, co
> + 	if ( flp->fl_state != FL_OPEN )
> + 		return( flp->fl_error ) ;
> + 
> +-	(void) time( &current_time ) ;
> ++	(void) _time( &current_time ) ;
> + 	tmp = localtime( &current_time ) ;
> + 	cc = Sprint( flp->fl_fd, "%02d/%d/%d@%02d:%02d:%02d",
> + 		tmp->tm_year%100, tmp->tm_mon+1, tmp->tm_mday,
> +--- a/src/xtimer.c
> ++++ b/src/xtimer.c
> +@@ -11,6 +11,15 @@
> + #include "pset.h"
> + #include "msg.h"
> + 
> ++time_t _time(time_t *t)
> ++{
> ++	struct timespec ts;
> ++	clock_gettime(CLOCK_MONOTONIC, &ts);
> ++	if(t)
> ++		*t = ts.tv_sec;
> ++	return ts.tv_sec;
> ++}
> ++
> + /* A note on the usage of timers in these functions:
> +  * The timers are composed of 3 elements, a pointer to a callback function,
> +  * the expire time of the timer, and a unique (pseudo-monotomically increasing)
> +@@ -68,7 +77,7 @@ int xtimer_add( void (*func)(void), time
> + 		return -1;
> + 	}
> + 
> +-	tmptime = time(NULL);
> ++	tmptime = _time(NULL);
> + 	if( tmptime == -1 ) {
> + 		free( new_xtimer );
> + 		return -1;
> +@@ -107,7 +116,7 @@ int xtimer_poll(void)
> + 
> + 	for( i = 0; i < pset_count( xtimer_list ); i++ ) {
> + 		xtime_h *cur_timer = pset_pointer( xtimer_list, i );
> +-		time_t cur_time    = time(NULL);
> ++		time_t cur_time    = _time(NULL);
> + 
> + 		/* The list is sorted, low to high.  If there's no
> + 		 * timers left, return.
> +@@ -163,7 +172,7 @@ time_t xtimer_nexttime(void)
> + 	if( pset_count(xtimer_list) == 0 )
> + 		return -1;
> + 
> +-	ret = ((xtime_h *)pset_pointer(xtimer_list, 0))->when - time(NULL) ;
> ++	ret = ((xtime_h *)pset_pointer(xtimer_list, 0))->when - _time(NULL) ;
> + 	if( ret < 0 )
> + 		ret = 0;
> + 	return( ret );
> +--- a/src/xtimer.h
> ++++ b/src/xtimer.h
> +@@ -22,4 +22,5 @@ int xtimer_poll(void);
> + int xtimer_remove(int);
> + time_t xtimer_nexttime(void);
> + 
> ++time_t _time(time_t *t);
> + #endif /* _X_TIMER_H */
> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
> index c6d356d227..94fc28ff6e 100644
> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
> @@ -13,6 +13,7 @@ SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https;branch=master \
>             file://xinetd.init \
>             file://xinetd.default \
>             file://xinetd.service \
> +           file://use-monotonic-time.patch \
>             "
>  
>  SRCREV = "6a4af7786630ce48747d9687e2f18f45ea6684c4"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202688): https://lists.openembedded.org/g/openembedded-core/message/202688
> Mute This Topic: https://lists.openembedded.org/mt/107640089/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


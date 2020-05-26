Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.510.1590526347194791550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 13:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AHlcW38K;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id a23so17430322qto.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tXjyyCh4Y1DVufGGvT+/FWrk9GQuDlsYQQOlOYPfZh4=;
        b=AHlcW38KG/wRc9idv28F+AhVYs9UNDqRu4AcfJAOE8QO/DTplkmBYpVc4VgcSCrxkq
         k/6NAMcu76AKmHpAt0kApGBXrHZcjcHxt3eMpjXJ/zGouDnyxeIvsGtm+FZTfDYS03tr
         7YEx7qEOOhAH3fpKVAC4iztZsH2jmknuD7qVEP8p+CFGRoTkE00HkNScv+Tk9V/AJgC0
         hsAkA6rJE5VvqNzj3R9ofSAPvRG+Bl470POXnYQT71BjrZG1Sa6oq4jcZ3NUXc77F5LN
         ichjhl8kfle8axLiFT1Zf3FYmbKmbwT+M/4byYjBCfO4yHVTQqoJIEvSUeGw6QpLWL1E
         CUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tXjyyCh4Y1DVufGGvT+/FWrk9GQuDlsYQQOlOYPfZh4=;
        b=ucvNWcpi6nkmXPzcCwbpCLKmhEYXBNGAlLqn21+ElDRE60IVaeVH4XRh636LRLp0Id
         AjkJ3oupPFOAskJ0ZlkD5eRaQ9+XSKehKG7GiyopVvO9T4eFNBZj4b9ARo1OkuIKnoQp
         aYIxSG0k5npciiMda0i54dGUZY0SQCsZqaXBUIMAI7KjPyTNml0XVbrxVkx/C3yOA1xE
         6q4OAa7xuZC7M90C0eseZyOEiacybVhp6nkwpN/31O/NwS9x4/T8CCNGp7ATTu9u3JKV
         toimS6GXidb3eZlDcl181iyeD0DseTdFgpqDstevdgy/PUajyP0xxzP2pDIYavxUkEBB
         w0Kw==
X-Gm-Message-State: AOAM533ORXcIdl5FouXiTdgG3Gw2N0CAGxt0fZ5L2Yjt6seopZYnTJr+
	xw4ZBPU045AVNdZFnYUiB4enjC7NBr7iRsv854/TcRaE
X-Google-Smtp-Source: ABdhPJy6+6/UKEt3ggudcuW9+qqrcTAVslcnD3MdSDmbBf/CamKeh2eQHQPJs94m7/8LrvFdpMclfSMhB2AwJbkbJjE=
X-Received: by 2002:ac8:5148:: with SMTP id h8mr740098qtn.316.1590526345827;
 Tue, 26 May 2020 13:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200526205104.1296720-1-raj.khem@gmail.com>
In-Reply-To: <20200526205104.1296720-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 26 May 2020 13:51:59 -0700
Message-ID: <CAMKF1so3ZeXMPmiY=5vMeqK-fYQwF-Aoftz337s25pvEEr4_jg@mail.gmail.com>
Subject: Re: [PATCH] bind: Apply CVE-2020-8616.patch for bind 9.11.13
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <sakoman@gmail.com>
Cc: Rense Jacob <Rense_Jacob2@comcast.com>
Content-Type: text/plain; charset="UTF-8"

Steve

this is Dunfell worthy too. So please track it.

On Tue, May 26, 2020 at 1:51 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Rense Jacob <Rense_Jacob2@comcast.com>
>
> backport for nvd.nist.gov/vuln/detail/CVE-2020-8616
>
> Signed-off-by: Rense <rense_jacob2@comcast.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../bind/bind/CVE-2020-8616.patch             | 221 ++++++++++++++++++
>  .../recipes-connectivity/bind/bind_9.11.13.bb |   1 +
>  2 files changed, 222 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
>
> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
> new file mode 100644
> index 0000000000..16ff86016b
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
> @@ -0,0 +1,221 @@
> +backport for nvd.nist.gov/vuln/detail/CVE-2020-8616
> +
> +Upstream-Status: Backport [downloads.isc.org/isc/bind9/9.11.19/patches/CVE-2020-8616.patch]
> +
> +Signed-off-by: Rense <rense_jacob2@comcast.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: bind-9.11.13/lib/dns/adb.c
> +===================================================================
> +--- bind-9.11.13.orig/lib/dns/adb.c
> ++++ bind-9.11.13/lib/dns/adb.c
> +@@ -404,16 +404,14 @@ static void log_quota(dns_adbentry_t *en
> +  */
> + #define FIND_WANTEVENT(fn)      (((fn)->options & DNS_ADBFIND_WANTEVENT) != 0)
> + #define FIND_WANTEMPTYEVENT(fn) (((fn)->options & DNS_ADBFIND_EMPTYEVENT) != 0)
> +-#define FIND_AVOIDFETCHES(fn)   (((fn)->options & DNS_ADBFIND_AVOIDFETCHES) \
> +-                               != 0)
> +-#define FIND_STARTATZONE(fn)    (((fn)->options & DNS_ADBFIND_STARTATZONE) \
> +-                               != 0)
> +-#define FIND_HINTOK(fn)         (((fn)->options & DNS_ADBFIND_HINTOK) != 0)
> +-#define FIND_GLUEOK(fn)         (((fn)->options & DNS_ADBFIND_GLUEOK) != 0)
> +-#define FIND_HAS_ADDRS(fn)      (!ISC_LIST_EMPTY((fn)->list))
> +-#define FIND_RETURNLAME(fn)     (((fn)->options & DNS_ADBFIND_RETURNLAME) != 0)
> +-
> +-/*
> ++#define FIND_AVOIDFETCHES(fn) (((fn)->options & DNS_ADBFIND_AVOIDFETCHES) != 0)
> ++#define FIND_STARTATZONE(fn)  (((fn)->options & DNS_ADBFIND_STARTATZONE) != 0)
> ++#define FIND_HINTOK(fn)               (((fn)->options & DNS_ADBFIND_HINTOK) != 0)
> ++#define FIND_GLUEOK(fn)               (((fn)->options & DNS_ADBFIND_GLUEOK) != 0)
> ++#define FIND_HAS_ADDRS(fn)    (!ISC_LIST_EMPTY((fn)->list))
> ++#define FIND_RETURNLAME(fn)   (((fn)->options & DNS_ADBFIND_RETURNLAME) != 0)
> ++#define FIND_NOFETCH(fn)      (((fn)->options & DNS_ADBFIND_NOFETCH) != 0)
> ++/*
> +  * These are currently used on simple unsigned ints, so they are
> +  * not really associated with any particular type.
> +  */
> +@@ -3155,21 +3153,25 @@ dns_adb_createfind2(dns_adb_t *adb, isc_
> +                * Listen to negative cache hints, and don't start
> +                * another query.
> +                */
> +-              if (NCACHE_RESULT(result) || AUTH_NX(result))
> ++              if (NCACHE_RESULT(result) || AUTH_NX(result)) {
> +                       goto fetch;
> +-
> +-              if (!NAME_FETCH_V6(adbname))
> ++                }
> ++              if (!NAME_FETCH_V6(adbname)) {
> +                       wanted_fetches |= DNS_ADBFIND_INET6;
> ++              }
> +       }
> +
> +  fetch:
> +       if ((WANT_INET(wanted_addresses) && NAME_HAS_V4(adbname)) ||
> +           (WANT_INET6(wanted_addresses) && NAME_HAS_V6(adbname)))
> ++      {
> +               have_address = true;
> +-      else
> +-              have_address = false;
> +-      if (wanted_fetches != 0 &&
> +-          ! (FIND_AVOIDFETCHES(find) && have_address)) {
> ++      } else {
> ++          have_address = false;
> ++      }
> ++      if (wanted_fetches != 0 && !(FIND_AVOIDFETCHES(find) && have_address) &&
> ++          !FIND_NOFETCH(find))
> ++      {
> +               /*
> +                * We're missing at least one address family.  Either the
> +                * caller hasn't instructed us to avoid fetches, or we don't
> +@@ -3177,8 +3179,9 @@ dns_adb_createfind2(dns_adb_t *adb, isc_
> +                * be acceptable so we have to launch fetches.
> +                */
> +
> +-              if (FIND_STARTATZONE(find))
> ++              if (FIND_STARTATZONE(find)) {
> +                       start_at_zone = true;
> ++              }
> +
> +               /*
> +                * Start V4.
> +Index: bind-9.11.13/lib/dns/include/dns/adb.h
> +===================================================================
> +--- bind-9.11.13.orig/lib/dns/include/dns/adb.h
> ++++ bind-9.11.13/lib/dns/include/dns/adb.h
> +@@ -209,6 +209,12 @@ struct dns_adbfind {
> + #define DNS_ADBFIND_OVERQUOTA         0x00000400
> +
> + /*%
> ++ *    Don't perform a fetch even if there are no address records available.
> ++ */
> ++#define DNS_ADBFIND_NOFETCH           0x00000800
> ++
> ++
> ++/*%
> +  * The answers to queries come back as a list of these.
> +  */
> + struct dns_adbaddrinfo {
> +Index: bind-9.11.13/lib/dns/resolver.c
> +===================================================================
> +--- bind-9.11.13.orig/lib/dns/resolver.c
> ++++ bind-9.11.13/lib/dns/resolver.c
> +@@ -172,6 +172,15 @@
> + #define DEFAULT_MAX_QUERIES 75
> + #endif
> +
> ++/*
> ++ * After NS_FAIL_LIMIT attempts to fetch a name server address,
> ++ * if the number of addresses in the NS RRset exceeds NS_RR_LIMIT,
> ++ * stop trying to fetch, in order to avoid wasting resources.
> ++ */
> ++#define NS_FAIL_LIMIT 4
> ++#define NS_RR_LIMIT   5
> ++
> ++
> + /* Number of hash buckets for zone counters */
> + #ifndef RES_DOMAIN_BUCKETS
> + #define RES_DOMAIN_BUCKETS    523
> +@@ -3118,8 +3127,8 @@ sort_finds(dns_adbfindlist_t *findlist,
> + static void
> + findname(fetchctx_t *fctx, dns_name_t *name, in_port_t port,
> +        unsigned int options, unsigned int flags, isc_stdtime_t now,
> +-       bool *overquota, bool *need_alternate)
> +-{
> ++       bool *overquota, bool *need_alternate, unsigned int *no_addresses) {
> ++
> +       dns_adbaddrinfo_t *ai;
> +       dns_adbfind_t *find;
> +       dns_resolver_t *res;
> +@@ -3207,7 +3216,13 @@ findname(fetchctx_t *fctx, dns_name_t *n
> +                             find->result_v6 != DNS_R_NXDOMAIN) ||
> +                            (res->dispatches6 == NULL &&
> +                             find->result_v4 != DNS_R_NXDOMAIN)))
> ++                            {
> +                               *need_alternate = true;
> ++                            }
> ++                      if (no_addresses != NULL) {
> ++                              (*no_addresses)++;
> ++                      }
> ++
> +               } else {
> +                       if ((find->options & DNS_ADBFIND_OVERQUOTA) != 0) {
> +                               if (overquota != NULL)
> +@@ -3258,6 +3273,7 @@ fctx_getaddresses(fetchctx_t *fctx, bool
> +       dns_rdata_ns_t ns;
> +       bool need_alternate = false;
> +       bool all_spilled = true;
> ++        unsigned int no_addresses = 0;
> +
> +       FCTXTRACE5("getaddresses", "fctx->depth=", fctx->depth);
> +
> +@@ -3425,21 +3441,28 @@ fctx_getaddresses(fetchctx_t *fctx, bool
> +                * Extract the name from the NS record.
> +                */
> +               result = dns_rdata_tostruct(&rdata, &ns, NULL);
> +-              if (result != ISC_R_SUCCESS)
> ++              if (result != ISC_R_SUCCESS) {
> +                       continue;
> ++              }
> ++
> ++                if (no_addresses > NS_FAIL_LIMIT &&
> ++                  dns_rdataset_count(&fctx->nameservers) > NS_RR_LIMIT)
> ++              {
> ++                      stdoptions |= DNS_ADBFIND_NOFETCH;
> ++              }
> ++              findname(fctx, &ns.name, 0, stdoptions, 0, now, &overquota,
> ++                       &need_alternate, &no_addresses);
> +
> +-              findname(fctx, &ns.name, 0, stdoptions, 0, now,
> +-                       &overquota, &need_alternate);
> +
> +-              if (!overquota)
> ++              if (!overquota) {
> +                       all_spilled = false;
> +-
> ++                }
> +               dns_rdata_reset(&rdata);
> +               dns_rdata_freestruct(&ns);
> +       }
> +-      if (result != ISC_R_NOMORE)
> ++      if (result != ISC_R_NOMORE) {
> +               return (result);
> +-
> ++        }
> +       /*
> +        * Do we need to use 6 to 4?
> +        */
> +@@ -3453,7 +3476,7 @@ fctx_getaddresses(fetchctx_t *fctx, bool
> +                       if (!a->isaddress) {
> +                               findname(fctx, &a->_u._n.name, a->_u._n.port,
> +                                        stdoptions, FCTX_ADDRINFO_FORWARDER,
> +-                                       now, NULL, NULL);
> ++                                       now, NULL, NULL, NULL);
> +                               continue;
> +                       }
> +                       if (isc_sockaddr_pf(&a->_u.addr) != family)
> +@@ -3815,16 +3838,15 @@ fctx_try(fetchctx_t *fctx, bool retrying
> +               }
> +       }
> +
> +-      if (dns_name_countlabels(&fctx->domain) > 2) {
> +-              result = isc_counter_increment(fctx->qc);
> +-              if (result != ISC_R_SUCCESS) {
> +-                      isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
> +-                                    DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
> +-                                    "exceeded max queries resolving '%s'",
> +-                                    fctx->info);
> +-                      fctx_done(fctx, DNS_R_SERVFAIL, __LINE__);
> +-                      return;
> +-              }
> ++
> ++        result = isc_counter_increment(fctx->qc);
> ++        if (result != ISC_R_SUCCESS) {
> ++            isc_log_write(dns_lctx, DNS_LOGCATEGORY_RESOLVER,
> ++                        DNS_LOGMODULE_RESOLVER, ISC_LOG_DEBUG(3),
> ++                        "exceeded max queries resolving '%s'",
> ++                        fctx->info);
> ++            fctx_done(fctx, DNS_R_SERVFAIL, __LINE__);
> ++            return;
> +       }
> +
> +       bucketnum = fctx->bucketnum;
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.13.bb b/meta/recipes-connectivity/bind/bind_9.11.13.bb
> index 4e64171cc1..e81678583d 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.13.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.11.13.bb
> @@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
>             file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
>             file://0001-avoid-start-failure-with-bind-user.patch \
> +           file://CVE-2020-8616.patch \
>             "
>
>  SRC_URI[md5sum] = "17de0d024ab1eac377f1c2854dc25057"
> --
> 2.26.2
>

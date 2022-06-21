Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d05ea756-3e5b-225d-c893-407f0527293f@mvista.com>
Date: Tue, 21 Jun 2022 09:41:39 +0530
MIME-Version: 1.0
Subject: Re: [OE-core] [dunfell][PATCH] openldap: CVE-2022-29155 OpenLDAP SQL injection
References: <20220620052143.7857-1-hprajapati@mvista.com>
 <144c5532-b026-c461-d63d-2d092376400b@gmail.com>
From: "Hitendra Prajapati" <hprajapati@mvista.com>
In-Reply-To: <144c5532-b026-c461-d63d-2d092376400b@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------iInamUUa3cNNZzAXIztUtjxy"
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org

--------------iInamUUa3cNNZzAXIztUtjxy
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi Team,

I'm sorry for my mistake in MAIL address.

Thank you for the correct direction.

On 20/06/22 23:07, akuster808 wrote:
> This should be sent to openembedded-devel@lists.openembedded.org
>
> it applies against meta-openembedded, not core.
>
> -armin
>
> On 6/19/22 22:21, Hitendra Prajapati wrote:
>> Source: https://git.openldap.org/openldap/openldap
>> MR: 117821
>> Type: Security Fix
>> Disposition: Backport from 
>> https://git.openldap.org/openldap/openldap/-/commit/87df6c19915042430540931d199a39105544a134
>> ChangeID: d534808c796600ca5994bcda28938d45405bc7b4
>> Description:
>>     CVE-2022-29155 openldap: OpenLDAP SQL injection
>>
>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> ---
>>   .../openldap/openldap/CVE-2022-29155.patch    | 277 ++++++++++++++++++
>>   .../openldap/openldap_2.4.57.bb               |   2 +-
>>   2 files changed, 278 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
>>
>> diff --git 
>> a/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch 
>> b/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
>> new file mode 100644
>> index 000000000..2860b9522
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
>> @@ -0,0 +1,277 @@
>> +From 11e136f15085a4bda5701e910988966bed699977 Mon Sep 17 00:00:00 2001
>> +From: Hitendra Prajapati <hprajapati@mvista.com>
>> +Date: Wed, 18 May 2022 13:57:59 +0530
>> +Subject: [PATCH] CVE-2022-29155
>> +
>> +Upstream-Status: Backport 
>> [https://git.openldap.org/openldap/openldap/-/commit/87df6c19915042430540931d199a39105544a134]
>> +CVE: CVE-2022-29155
>> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> +
>> +---
>> + servers/slapd/back-sql/search.c | 123 +++++++++++++++++++++++++++-----
>> + 1 file changed, 105 insertions(+), 18 deletions(-)
>> +
>> +diff --git a/servers/slapd/back-sql/search.c 
>> b/servers/slapd/back-sql/search.c
>> +index bb0f1e2..1770bde 100644
>> +--- a/servers/slapd/back-sql/search.c
>> ++++ b/servers/slapd/back-sql/search.c
>> +@@ -63,6 +63,38 @@ static void send_paged_response(
>> +     ID  *lastid );
>> + #endif /* ! BACKSQL_ARBITRARY_KEY */
>> +
>> ++/* Look for chars that need to be escaped, return count of them.
>> ++ * If out is non-NULL, copy escape'd val to it.
>> ++ */
>> ++static int
>> ++backsql_val_escape( Operation *op, struct berval *in, struct berval 
>> *out )
>> ++{
>> ++    char *ptr, *end;
>> ++    int q = 0;
>> ++
>> ++    ptr = in->bv_val;
>> ++    end = ptr + in->bv_len;
>> ++    while (ptr < end) {
>> ++        if ( *ptr == '\'' )
>> ++            q++;
>> ++        ptr++;
>> ++    }
>> ++    if ( q && out ) {
>> ++        char *dst;
>> ++        out->bv_len = in->bv_len + q;
>> ++        out->bv_val = op->o_tmpalloc( out->bv_len + 1, 
>> op->o_tmpmemctx );
>> ++        ptr = in->bv_val;
>> ++        dst = out->bv_val;
>> ++        while (ptr < end ) {
>> ++            if ( *ptr == '\'' )
>> ++                *dst++ = '\'';
>> ++            *dst++ = *ptr++;
>> ++        }
>> ++        *dst = '\0';
>> ++    }
>> ++    return q;
>> ++}
>> ++
>> + static int
>> + backsql_attrlist_add( backsql_srch_info *bsi, AttributeDescription 
>> *ad )
>> + {
>> +@@ -429,6 +461,8 @@ backsql_process_sub_filter( backsql_srch_info 
>> *bsi, Filter *f,
>> +     backsql_info        *bi = (backsql_info 
>> *)bsi->bsi_op->o_bd->be_private;
>> +     int            i;
>> +     int            casefold = 0;
>> ++    int            escaped = 0;
>> ++    struct berval    escval, *fvalue;
>> +
>> +     if ( !f ) {
>> +         return 0;
>> +@@ -462,50 +496,68 @@ backsql_process_sub_filter( backsql_srch_info 
>> *bsi, Filter *f,
>> +
>> +         BER_BVZERO( &bv );
>> +         if ( f->f_sub_initial.bv_val ) {
>> +-            bv.bv_len += f->f_sub_initial.bv_len;
>> ++            bv.bv_len += f->f_sub_initial.bv_len + 
>> backsql_val_escape( NULL, &f->f_sub_initial, NULL );
>> +         }
>> +         if ( f->f_sub_any != NULL ) {
>> +             for ( a = 0; f->f_sub_any[ a ].bv_val != NULL; a++ ) {
>> +-                bv.bv_len += f->f_sub_any[ a ].bv_len;
>> ++                bv.bv_len += f->f_sub_any[ a ].bv_len + 
>> backsql_val_escape( NULL, &f->f_sub_any[ a ], NULL );
>> +             }
>> +         }
>> +         if ( f->f_sub_final.bv_val ) {
>> +-            bv.bv_len += f->f_sub_final.bv_len;
>> ++            bv.bv_len += f->f_sub_final.bv_len + 
>> backsql_val_escape( NULL, &f->f_sub_final, NULL );
>> +         }
>> +         bv.bv_len = 2 * bv.bv_len - 1;
>> +         bv.bv_val = ch_malloc( bv.bv_len + 1 );
>> +
>> +         s = 0;
>> +         if ( !BER_BVISNULL( &f->f_sub_initial ) ) {
>> +-            bv.bv_val[ s ] = f->f_sub_initial.bv_val[ 0 ];
>> +-            for ( i = 1; i < f->f_sub_initial.bv_len; i++ ) {
>> ++            fvalue = &f->f_sub_initial;
>> ++            escaped = backsql_val_escape( bsi->bsi_op, fvalue, 
>> &escval );
>> ++            if ( escaped )
>> ++                fvalue = &escval;
>> ++            bv.bv_val[ s ] = fvalue->bv_val[ 0 ];
>> ++            for ( i = 1; i < fvalue->bv_len; i++ ) {
>> +                 bv.bv_val[ s + 2 * i - 1 ] = '%';
>> +-                bv.bv_val[ s + 2 * i ] = f->f_sub_initial.bv_val[ i ];
>> ++                bv.bv_val[ s + 2 * i ] = fvalue->bv_val[ i ];
>> +             }
>> +             bv.bv_val[ s + 2 * i - 1 ] = '%';
>> +             s += 2 * i;
>> ++            if ( escaped )
>> ++                bsi->bsi_op->o_tmpfree( escval.bv_val, 
>> bsi->bsi_op->o_tmpmemctx );
>> +         }
>> +
>> +         if ( f->f_sub_any != NULL ) {
>> +             for ( a = 0; !BER_BVISNULL( &f->f_sub_any[ a ] ); a++ ) {
>> +-                bv.bv_val[ s ] = f->f_sub_any[ a ].bv_val[ 0 ];
>> +-                for ( i = 1; i < f->f_sub_any[ a ].bv_len; i++ ) {
>> ++                fvalue = &f->f_sub_any[ a ];
>> ++                escaped = backsql_val_escape( bsi->bsi_op, fvalue, 
>> &escval );
>> ++                if ( escaped )
>> ++                    fvalue = &escval;
>> ++                bv.bv_val[ s ] = fvalue->bv_val[ 0 ];
>> ++                for ( i = 1; i < fvalue->bv_len; i++ ) {
>> +                     bv.bv_val[ s + 2 * i - 1 ] = '%';
>> +-                    bv.bv_val[ s + 2 * i ] = f->f_sub_any[ a 
>> ].bv_val[ i ];
>> ++                    bv.bv_val[ s + 2 * i ] = fvalue->bv_val[ i ];
>> +                 }
>> +                 bv.bv_val[ s + 2 * i - 1 ] = '%';
>> +                 s += 2 * i;
>> ++                if ( escaped )
>> ++                    bsi->bsi_op->o_tmpfree( escval.bv_val, 
>> bsi->bsi_op->o_tmpmemctx );
>> +             }
>> +         }
>> +
>> +         if ( !BER_BVISNULL( &f->f_sub_final ) ) {
>> +-            bv.bv_val[ s ] = f->f_sub_final.bv_val[ 0 ];
>> +-            for ( i = 1; i < f->f_sub_final.bv_len; i++ ) {
>> ++            fvalue = &f->f_sub_final;
>> ++            escaped = backsql_val_escape( bsi->bsi_op, fvalue, 
>> &escval );
>> ++            if ( escaped )
>> ++                fvalue = &escval;
>> ++            bv.bv_val[ s ] = fvalue->bv_val[ 0 ];
>> ++            for ( i = 1; i < fvalue->bv_len; i++ ) {
>> +                 bv.bv_val[ s + 2 * i - 1 ] = '%';
>> +-                bv.bv_val[ s + 2 * i ] = f->f_sub_final.bv_val[ i ];
>> ++                bv.bv_val[ s + 2 * i ] = fvalue->bv_val[ i ];
>> +             }
>> +-                bv.bv_val[ s + 2 * i - 1 ] = '%';
>> ++            bv.bv_val[ s + 2 * i - 1 ] = '%';
>> +             s += 2 * i;
>> ++            if ( escaped )
>> ++                bsi->bsi_op->o_tmpfree( escval.bv_val, 
>> bsi->bsi_op->o_tmpmemctx );
>> +         }
>> +
>> +         bv.bv_val[ s - 1 ] = '\0';
>> +@@ -561,11 +613,17 @@ backsql_process_sub_filter( backsql_srch_info 
>> *bsi, Filter *f,
>> +             f->f_sub_initial.bv_val, 0 );
>> + #endif /* BACKSQL_TRACE */
>> +
>> ++        fvalue = &f->f_sub_initial;
>> ++        escaped = backsql_val_escape( bsi->bsi_op, fvalue, &escval );
>> ++        if ( escaped )
>> ++            fvalue = &escval;
>> +         start = bsi->bsi_flt_where.bb_val.bv_len;
>> +         backsql_strfcat_x( &bsi->bsi_flt_where,
>> +                 bsi->bsi_op->o_tmpmemctx,
>> +                 "b",
>> +-                &f->f_sub_initial );
>> ++                fvalue );
>> ++        if ( escaped )
>> ++            bsi->bsi_op->o_tmpfree( escval.bv_val, 
>> bsi->bsi_op->o_tmpmemctx );
>> +         if ( casefold && BACKSQL_AT_CANUPPERCASE( at ) ) {
>> +             ldap_pvt_str2upper( &bsi->bsi_flt_where.bb_val.bv_val[ 
>> start ] );
>> +         }
>> +@@ -586,12 +644,18 @@ backsql_process_sub_filter( backsql_srch_info 
>> *bsi, Filter *f,
>> +                 i, f->f_sub_any[ i ].bv_val );
>> + #endif /* BACKSQL_TRACE */
>> +
>> ++            fvalue = &f->f_sub_any[ i ];
>> ++            escaped = backsql_val_escape( bsi->bsi_op, fvalue, 
>> &escval );
>> ++            if ( escaped )
>> ++                fvalue = &escval;
>> +             start = bsi->bsi_flt_where.bb_val.bv_len;
>> +             backsql_strfcat_x( &bsi->bsi_flt_where,
>> +                     bsi->bsi_op->o_tmpmemctx,
>> +                     "bc",
>> +-                    &f->f_sub_any[ i ],
>> ++                    fvalue,
>> +                     '%' );
>> ++            if ( escaped )
>> ++                bsi->bsi_op->o_tmpfree( escval.bv_val, 
>> bsi->bsi_op->o_tmpmemctx );
>> +             if ( casefold && BACKSQL_AT_CANUPPERCASE( at ) ) {
>> +                 /*
>> +                  * Note: toupper('%') = '%'
>> +@@ -611,11 +675,17 @@ backsql_process_sub_filter( backsql_srch_info 
>> *bsi, Filter *f,
>> +             f->f_sub_final.bv_val, 0 );
>> + #endif /* BACKSQL_TRACE */
>> +
>> ++        fvalue = &f->f_sub_final;
>> ++        escaped = backsql_val_escape( bsi->bsi_op, fvalue, &escval );
>> ++        if ( escaped )
>> ++            fvalue = &escval;
>> +         start = bsi->bsi_flt_where.bb_val.bv_len;
>> +             backsql_strfcat_x( &bsi->bsi_flt_where,
>> +                 bsi->bsi_op->o_tmpmemctx,
>> +                 "b",
>> +-                &f->f_sub_final );
>> ++                fvalue );
>> ++        if ( escaped )
>> ++            bsi->bsi_op->o_tmpfree( escval.bv_val, 
>> bsi->bsi_op->o_tmpmemctx );
>> +           if ( casefold && BACKSQL_AT_CANUPPERCASE( at ) ) {
>> +             ldap_pvt_str2upper( &bsi->bsi_flt_where.bb_val.bv_val[ 
>> start ] );
>> +         }
>> +@@ -1183,6 +1253,8 @@ backsql_process_filter_attr( backsql_srch_info 
>> *bsi, Filter *f, backsql_at_map_r
>> +     struct berval        *filter_value = NULL;
>> +     MatchingRule        *matching_rule = NULL;
>> +     struct berval        ordering = BER_BVC("<=");
>> ++    struct berval        escval;
>> ++    int                    escaped = 0;
>> +
>> +     Debug( LDAP_DEBUG_TRACE, "==>backsql_process_filter_attr(%s)\n",
>> +         at->bam_ad->ad_cname.bv_val, 0, 0 );
>> +@@ -1237,6 +1309,10 @@ equality_match:;
>> +             casefold = 1;
>> +         }
>> +
>> ++        escaped = backsql_val_escape( bsi->bsi_op, filter_value, 
>> &escval );
>> ++        if ( escaped )
>> ++            filter_value = &escval;
>> ++
>> +         /* FIXME: directoryString filtering should use a similar
>> +          * approach to deal with non-prettified values like
>> +          * " A  non    prettified   value  ", by using a LIKE
>> +@@ -1317,6 +1393,10 @@ equality_match:;
>> +             casefold = 1;
>> +         }
>> +
>> ++        escaped = backsql_val_escape( bsi->bsi_op, filter_value, 
>> &escval );
>> ++        if ( escaped )
>> ++            filter_value = &escval;
>> ++
>> +         /*
>> +          * FIXME: should we uppercase the operands?
>> +          */
>> +@@ -1350,7 +1430,7 @@ equality_match:;
>> +                     &at->bam_sel_expr,
>> +                     &ordering,
>> +                     '\'',
>> +-                    &f->f_av_value,
>> ++                    filter_value,
>> +                     (ber_len_t)STRLENOF( /* (' */ "')" ),
>> +                         /* ( */ "')" );
>> +         }
>> +@@ -1374,13 +1454,17 @@ equality_match:;
>> +     case LDAP_FILTER_APPROX:
>> +         /* we do our best */
>> +
>> ++        filter_value = &f->f_av_value;
>> ++        escaped = backsql_val_escape( bsi->bsi_op, filter_value, 
>> &escval );
>> ++        if ( escaped )
>> ++            filter_value = &escval;
>> +         /*
>> +          * maybe we should check type of at->sel_expr here somehow,
>> +          * to know whether upper_func is applicable, but for now
>> +          * upper_func stuff is made for Oracle, where UPPER is
>> +          * safely applicable to NUMBER etc.
>> +          */
>> +-        (void)backsql_process_filter_like( bsi, at, 1, 
>> &f->f_av_value );
>> ++        (void)backsql_process_filter_like( bsi, at, 1, filter_value );
>> +         break;
>> +
>> +     default:
>> +@@ -1394,6 +1478,9 @@ equality_match:;
>> +
>> +     }
>> +
>> ++    if ( escaped )
>> ++        bsi->bsi_op->o_tmpfree( escval.bv_val, 
>> bsi->bsi_op->o_tmpmemctx );
>> ++
>> +     Debug( LDAP_DEBUG_TRACE, "<==backsql_process_filter_attr(%s)\n",
>> +         at->bam_ad->ad_cname.bv_val, 0, 0 );
>> +
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb 
>> b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>> index a282523a3..e3e9caa1b 100644
>> --- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>> @@ -23,8 +23,8 @@ SRC_URI = 
>> "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>> file://thread_stub.patch \
>> file://openldap-CVE-2015-3276.patch \
>> file://remove-user-host-pwd-from-version.patch \
>> + file://CVE-2022-29155.patch \
>>   "
>> -
>>   SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
>>   SRC_URI[sha256sum] = 
>> "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
>>
>> 
>>
>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC

--------------iInamUUa3cNNZzAXIztUtjxy
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Team,</p>
    <p>I'm sorry for my mistake in MAIL address. <br>
    </p>
    <p>Thank you for the correct direction.<br>
    </p>
    <div class="moz-cite-prefix">On 20/06/22 23:07, akuster808 wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:144c5532-b026-c461-d63d-2d092376400b@gmail.com">This
      should be sent to <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>
      <br>
      <br>
      it applies against meta-openembedded, not core.
      <br>
      <br>
      -armin
      <br>
      <br>
      On 6/19/22 22:21, Hitendra Prajapati wrote:
      <br>
      <blockquote type="cite">Source:
        <a class="moz-txt-link-freetext" href="https://git.openldap.org/openldap/openldap">https://git.openldap.org/openldap/openldap</a>
        <br>
        MR: 117821
        <br>
        Type: Security Fix
        <br>
        Disposition: Backport from
<a class="moz-txt-link-freetext" href="https://git.openldap.org/openldap/openldap/-/commit/87df6c19915042430540931d199a39105544a134">https://git.openldap.org/openldap/openldap/-/commit/87df6c19915042430540931d199a39105544a134</a><br>
        ChangeID: d534808c796600ca5994bcda28938d45405bc7b4
        <br>
        Description:
        <br>
            CVE-2022-29155 openldap: OpenLDAP SQL injection
        <br>
        <br>
        Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
        <br>
        ---
        <br>
          .../openldap/openldap/CVE-2022-29155.patch    | 277
        ++++++++++++++++++
        <br>
          .../openldap/openldap_2.4.57.bb               |   2 +-
        <br>
          2 files changed, 278 insertions(+), 1 deletion(-)
        <br>
          create mode 100644
        meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
        <br>
        <br>
        diff --git
        a/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
        b/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
        <br>
        new file mode 100644
        <br>
        index 000000000..2860b9522
        <br>
        --- /dev/null
        <br>
        +++
        b/meta-oe/recipes-support/openldap/openldap/CVE-2022-29155.patch
        <br>
        @@ -0,0 +1,277 @@
        <br>
        +From 11e136f15085a4bda5701e910988966bed699977 Mon Sep 17
        00:00:00 2001
        <br>
        +From: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
        <br>
        +Date: Wed, 18 May 2022 13:57:59 +0530
        <br>
        +Subject: [PATCH] CVE-2022-29155
        <br>
        +
        <br>
        +Upstream-Status: Backport
[<a class="moz-txt-link-freetext" href="https://git.openldap.org/openldap/openldap/-/commit/87df6c19915042430540931d199a39105544a134">https://git.openldap.org/openldap/openldap/-/commit/87df6c19915042430540931d199a39105544a134</a>]<br>
        +CVE: CVE-2022-29155
        <br>
        +Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
        <br>
        +
        <br>
        +---
        <br>
        + servers/slapd/back-sql/search.c | 123
        +++++++++++++++++++++++++++-----
        <br>
        + 1 file changed, 105 insertions(+), 18 deletions(-)
        <br>
        +
        <br>
        +diff --git a/servers/slapd/back-sql/search.c
        b/servers/slapd/back-sql/search.c
        <br>
        +index bb0f1e2..1770bde 100644
        <br>
        +--- a/servers/slapd/back-sql/search.c
        <br>
        ++++ b/servers/slapd/back-sql/search.c
        <br>
        +@@ -63,6 +63,38 @@ static void send_paged_response(
        <br>
        +     ID  *lastid );
        <br>
        + #endif /* ! BACKSQL_ARBITRARY_KEY */
        <br>
        +
        <br>
        ++/* Look for chars that need to be escaped, return count of
        them.
        <br>
        ++ * If out is non-NULL, copy escape'd val to it.
        <br>
        ++ */
        <br>
        ++static int
        <br>
        ++backsql_val_escape( Operation *op, struct berval *in, struct
        berval *out )
        <br>
        ++{
        <br>
        ++    char *ptr, *end;
        <br>
        ++    int q = 0;
        <br>
        ++
        <br>
        ++    ptr = in-&gt;bv_val;
        <br>
        ++    end = ptr + in-&gt;bv_len;
        <br>
        ++    while (ptr &lt; end) {
        <br>
        ++        if ( *ptr == '\'' )
        <br>
        ++            q++;
        <br>
        ++        ptr++;
        <br>
        ++    }
        <br>
        ++    if ( q &amp;&amp; out ) {
        <br>
        ++        char *dst;
        <br>
        ++        out-&gt;bv_len = in-&gt;bv_len + q;
        <br>
        ++        out-&gt;bv_val = op-&gt;o_tmpalloc( out-&gt;bv_len +
        1, op-&gt;o_tmpmemctx );
        <br>
        ++        ptr = in-&gt;bv_val;
        <br>
        ++        dst = out-&gt;bv_val;
        <br>
        ++        while (ptr &lt; end ) {
        <br>
        ++            if ( *ptr == '\'' )
        <br>
        ++                *dst++ = '\'';
        <br>
        ++            *dst++ = *ptr++;
        <br>
        ++        }
        <br>
        ++        *dst = '\0';
        <br>
        ++    }
        <br>
        ++    return q;
        <br>
        ++}
        <br>
        ++
        <br>
        + static int
        <br>
        + backsql_attrlist_add( backsql_srch_info *bsi,
        AttributeDescription *ad )
        <br>
        + {
        <br>
        +@@ -429,6 +461,8 @@ backsql_process_sub_filter(
        backsql_srch_info *bsi, Filter *f,
        <br>
        +     backsql_info        *bi = (backsql_info
        *)bsi-&gt;bsi_op-&gt;o_bd-&gt;be_private;
        <br>
        +     int            i;
        <br>
        +     int            casefold = 0;
        <br>
        ++    int            escaped = 0;
        <br>
        ++    struct berval    escval, *fvalue;
        <br>
        +
        <br>
        +     if ( !f ) {
        <br>
        +         return 0;
        <br>
        +@@ -462,50 +496,68 @@ backsql_process_sub_filter(
        backsql_srch_info *bsi, Filter *f,
        <br>
        +
        <br>
        +         BER_BVZERO( &amp;bv );
        <br>
        +         if ( f-&gt;f_sub_initial.bv_val ) {
        <br>
        +-            bv.bv_len += f-&gt;f_sub_initial.bv_len;
        <br>
        ++            bv.bv_len += f-&gt;f_sub_initial.bv_len +
        backsql_val_escape( NULL, &amp;f-&gt;f_sub_initial, NULL );
        <br>
        +         }
        <br>
        +         if ( f-&gt;f_sub_any != NULL ) {
        <br>
        +             for ( a = 0; f-&gt;f_sub_any[ a ].bv_val != NULL;
        a++ ) {
        <br>
        +-                bv.bv_len += f-&gt;f_sub_any[ a ].bv_len;
        <br>
        ++                bv.bv_len += f-&gt;f_sub_any[ a ].bv_len +
        backsql_val_escape( NULL, &amp;f-&gt;f_sub_any[ a ], NULL );
        <br>
        +             }
        <br>
        +         }
        <br>
        +         if ( f-&gt;f_sub_final.bv_val ) {
        <br>
        +-            bv.bv_len += f-&gt;f_sub_final.bv_len;
        <br>
        ++            bv.bv_len += f-&gt;f_sub_final.bv_len +
        backsql_val_escape( NULL, &amp;f-&gt;f_sub_final, NULL );
        <br>
        +         }
        <br>
        +         bv.bv_len = 2 * bv.bv_len - 1;
        <br>
        +         bv.bv_val = ch_malloc( bv.bv_len + 1 );
        <br>
        +
        <br>
        +         s = 0;
        <br>
        +         if ( !BER_BVISNULL( &amp;f-&gt;f_sub_initial ) ) {
        <br>
        +-            bv.bv_val[ s ] = f-&gt;f_sub_initial.bv_val[ 0 ];
        <br>
        +-            for ( i = 1; i &lt; f-&gt;f_sub_initial.bv_len;
        i++ ) {
        <br>
        ++            fvalue = &amp;f-&gt;f_sub_initial;
        <br>
        ++            escaped = backsql_val_escape( bsi-&gt;bsi_op,
        fvalue, &amp;escval );
        <br>
        ++            if ( escaped )
        <br>
        ++                fvalue = &amp;escval;
        <br>
        ++            bv.bv_val[ s ] = fvalue-&gt;bv_val[ 0 ];
        <br>
        ++            for ( i = 1; i &lt; fvalue-&gt;bv_len; i++ ) {
        <br>
        +                 bv.bv_val[ s + 2 * i - 1 ] = '%';
        <br>
        +-                bv.bv_val[ s + 2 * i ] =
        f-&gt;f_sub_initial.bv_val[ i ];
        <br>
        ++                bv.bv_val[ s + 2 * i ] = fvalue-&gt;bv_val[ i
        ];
        <br>
        +             }
        <br>
        +             bv.bv_val[ s + 2 * i - 1 ] = '%';
        <br>
        +             s += 2 * i;
        <br>
        ++            if ( escaped )
        <br>
        ++                bsi-&gt;bsi_op-&gt;o_tmpfree( escval.bv_val,
        bsi-&gt;bsi_op-&gt;o_tmpmemctx );
        <br>
        +         }
        <br>
        +
        <br>
        +         if ( f-&gt;f_sub_any != NULL ) {
        <br>
        +             for ( a = 0; !BER_BVISNULL( &amp;f-&gt;f_sub_any[
        a ] ); a++ ) {
        <br>
        +-                bv.bv_val[ s ] = f-&gt;f_sub_any[ a ].bv_val[
        0 ];
        <br>
        +-                for ( i = 1; i &lt; f-&gt;f_sub_any[ a
        ].bv_len; i++ ) {
        <br>
        ++                fvalue = &amp;f-&gt;f_sub_any[ a ];
        <br>
        ++                escaped = backsql_val_escape( bsi-&gt;bsi_op,
        fvalue, &amp;escval );
        <br>
        ++                if ( escaped )
        <br>
        ++                    fvalue = &amp;escval;
        <br>
        ++                bv.bv_val[ s ] = fvalue-&gt;bv_val[ 0 ];
        <br>
        ++                for ( i = 1; i &lt; fvalue-&gt;bv_len; i++ ) {
        <br>
        +                     bv.bv_val[ s + 2 * i - 1 ] = '%';
        <br>
        +-                    bv.bv_val[ s + 2 * i ] = f-&gt;f_sub_any[
        a ].bv_val[ i ];
        <br>
        ++                    bv.bv_val[ s + 2 * i ] =
        fvalue-&gt;bv_val[ i ];
        <br>
        +                 }
        <br>
        +                 bv.bv_val[ s + 2 * i - 1 ] = '%';
        <br>
        +                 s += 2 * i;
        <br>
        ++                if ( escaped )
        <br>
        ++                    bsi-&gt;bsi_op-&gt;o_tmpfree(
        escval.bv_val, bsi-&gt;bsi_op-&gt;o_tmpmemctx );
        <br>
        +             }
        <br>
        +         }
        <br>
        +
        <br>
        +         if ( !BER_BVISNULL( &amp;f-&gt;f_sub_final ) ) {
        <br>
        +-            bv.bv_val[ s ] = f-&gt;f_sub_final.bv_val[ 0 ];
        <br>
        +-            for ( i = 1; i &lt; f-&gt;f_sub_final.bv_len; i++
        ) {
        <br>
        ++            fvalue = &amp;f-&gt;f_sub_final;
        <br>
        ++            escaped = backsql_val_escape( bsi-&gt;bsi_op,
        fvalue, &amp;escval );
        <br>
        ++            if ( escaped )
        <br>
        ++                fvalue = &amp;escval;
        <br>
        ++            bv.bv_val[ s ] = fvalue-&gt;bv_val[ 0 ];
        <br>
        ++            for ( i = 1; i &lt; fvalue-&gt;bv_len; i++ ) {
        <br>
        +                 bv.bv_val[ s + 2 * i - 1 ] = '%';
        <br>
        +-                bv.bv_val[ s + 2 * i ] =
        f-&gt;f_sub_final.bv_val[ i ];
        <br>
        ++                bv.bv_val[ s + 2 * i ] = fvalue-&gt;bv_val[ i
        ];
        <br>
        +             }
        <br>
        +-                bv.bv_val[ s + 2 * i - 1 ] = '%';
        <br>
        ++            bv.bv_val[ s + 2 * i - 1 ] = '%';
        <br>
        +             s += 2 * i;
        <br>
        ++            if ( escaped )
        <br>
        ++                bsi-&gt;bsi_op-&gt;o_tmpfree( escval.bv_val,
        bsi-&gt;bsi_op-&gt;o_tmpmemctx );
        <br>
        +         }
        <br>
        +
        <br>
        +         bv.bv_val[ s - 1 ] = '\0';
        <br>
        +@@ -561,11 +613,17 @@ backsql_process_sub_filter(
        backsql_srch_info *bsi, Filter *f,
        <br>
        +             f-&gt;f_sub_initial.bv_val, 0 );
        <br>
        + #endif /* BACKSQL_TRACE */
        <br>
        +
        <br>
        ++        fvalue = &amp;f-&gt;f_sub_initial;
        <br>
        ++        escaped = backsql_val_escape( bsi-&gt;bsi_op, fvalue,
        &amp;escval );
        <br>
        ++        if ( escaped )
        <br>
        ++            fvalue = &amp;escval;
        <br>
        +         start = bsi-&gt;bsi_flt_where.bb_val.bv_len;
        <br>
        +         backsql_strfcat_x( &amp;bsi-&gt;bsi_flt_where,
        <br>
        +                 bsi-&gt;bsi_op-&gt;o_tmpmemctx,
        <br>
        +                 "b",
        <br>
        +-                &amp;f-&gt;f_sub_initial );
        <br>
        ++                fvalue );
        <br>
        ++        if ( escaped )
        <br>
        ++            bsi-&gt;bsi_op-&gt;o_tmpfree( escval.bv_val,
        bsi-&gt;bsi_op-&gt;o_tmpmemctx );
        <br>
        +         if ( casefold &amp;&amp; BACKSQL_AT_CANUPPERCASE( at )
        ) {
        <br>
        +             ldap_pvt_str2upper(
        &amp;bsi-&gt;bsi_flt_where.bb_val.bv_val[ start ] );
        <br>
        +         }
        <br>
        +@@ -586,12 +644,18 @@ backsql_process_sub_filter(
        backsql_srch_info *bsi, Filter *f,
        <br>
        +                 i, f-&gt;f_sub_any[ i ].bv_val );
        <br>
        + #endif /* BACKSQL_TRACE */
        <br>
        +
        <br>
        ++            fvalue = &amp;f-&gt;f_sub_any[ i ];
        <br>
        ++            escaped = backsql_val_escape( bsi-&gt;bsi_op,
        fvalue, &amp;escval );
        <br>
        ++            if ( escaped )
        <br>
        ++                fvalue = &amp;escval;
        <br>
        +             start = bsi-&gt;bsi_flt_where.bb_val.bv_len;
        <br>
        +             backsql_strfcat_x( &amp;bsi-&gt;bsi_flt_where,
        <br>
        +                     bsi-&gt;bsi_op-&gt;o_tmpmemctx,
        <br>
        +                     "bc",
        <br>
        +-                    &amp;f-&gt;f_sub_any[ i ],
        <br>
        ++                    fvalue,
        <br>
        +                     '%' );
        <br>
        ++            if ( escaped )
        <br>
        ++                bsi-&gt;bsi_op-&gt;o_tmpfree( escval.bv_val,
        bsi-&gt;bsi_op-&gt;o_tmpmemctx );
        <br>
        +             if ( casefold &amp;&amp; BACKSQL_AT_CANUPPERCASE(
        at ) ) {
        <br>
        +                 /*
        <br>
        +                  * Note: toupper('%') = '%'
        <br>
        +@@ -611,11 +675,17 @@ backsql_process_sub_filter(
        backsql_srch_info *bsi, Filter *f,
        <br>
        +             f-&gt;f_sub_final.bv_val, 0 );
        <br>
        + #endif /* BACKSQL_TRACE */
        <br>
        +
        <br>
        ++        fvalue = &amp;f-&gt;f_sub_final;
        <br>
        ++        escaped = backsql_val_escape( bsi-&gt;bsi_op, fvalue,
        &amp;escval );
        <br>
        ++        if ( escaped )
        <br>
        ++            fvalue = &amp;escval;
        <br>
        +         start = bsi-&gt;bsi_flt_where.bb_val.bv_len;
        <br>
        +             backsql_strfcat_x( &amp;bsi-&gt;bsi_flt_where,
        <br>
        +                 bsi-&gt;bsi_op-&gt;o_tmpmemctx,
        <br>
        +                 "b",
        <br>
        +-                &amp;f-&gt;f_sub_final );
        <br>
        ++                fvalue );
        <br>
        ++        if ( escaped )
        <br>
        ++            bsi-&gt;bsi_op-&gt;o_tmpfree( escval.bv_val,
        bsi-&gt;bsi_op-&gt;o_tmpmemctx );
        <br>
        +           if ( casefold &amp;&amp; BACKSQL_AT_CANUPPERCASE( at
        ) ) {
        <br>
        +             ldap_pvt_str2upper(
        &amp;bsi-&gt;bsi_flt_where.bb_val.bv_val[ start ] );
        <br>
        +         }
        <br>
        +@@ -1183,6 +1253,8 @@ backsql_process_filter_attr(
        backsql_srch_info *bsi, Filter *f, backsql_at_map_r
        <br>
        +     struct berval        *filter_value = NULL;
        <br>
        +     MatchingRule        *matching_rule = NULL;
        <br>
        +     struct berval        ordering = BER_BVC("&lt;=");
        <br>
        ++    struct berval        escval;
        <br>
        ++    int                    escaped = 0;
        <br>
        +
        <br>
        +     Debug( LDAP_DEBUG_TRACE,
        "==&gt;backsql_process_filter_attr(%s)\n",
        <br>
        +         at-&gt;bam_ad-&gt;ad_cname.bv_val, 0, 0 );
        <br>
        +@@ -1237,6 +1309,10 @@ equality_match:;
        <br>
        +             casefold = 1;
        <br>
        +         }
        <br>
        +
        <br>
        ++        escaped = backsql_val_escape( bsi-&gt;bsi_op,
        filter_value, &amp;escval );
        <br>
        ++        if ( escaped )
        <br>
        ++            filter_value = &amp;escval;
        <br>
        ++
        <br>
        +         /* FIXME: directoryString filtering should use a
        similar
        <br>
        +          * approach to deal with non-prettified values like
        <br>
        +          * " A  non    prettified   value  ", by using a LIKE
        <br>
        +@@ -1317,6 +1393,10 @@ equality_match:;
        <br>
        +             casefold = 1;
        <br>
        +         }
        <br>
        +
        <br>
        ++        escaped = backsql_val_escape( bsi-&gt;bsi_op,
        filter_value, &amp;escval );
        <br>
        ++        if ( escaped )
        <br>
        ++            filter_value = &amp;escval;
        <br>
        ++
        <br>
        +         /*
        <br>
        +          * FIXME: should we uppercase the operands?
        <br>
        +          */
        <br>
        +@@ -1350,7 +1430,7 @@ equality_match:;
        <br>
        +                     &amp;at-&gt;bam_sel_expr,
        <br>
        +                     &amp;ordering,
        <br>
        +                     '\'',
        <br>
        +-                    &amp;f-&gt;f_av_value,
        <br>
        ++                    filter_value,
        <br>
        +                     (ber_len_t)STRLENOF( /* (' */ "')" ),
        <br>
        +                         /* ( */ "')" );
        <br>
        +         }
        <br>
        +@@ -1374,13 +1454,17 @@ equality_match:;
        <br>
        +     case LDAP_FILTER_APPROX:
        <br>
        +         /* we do our best */
        <br>
        +
        <br>
        ++        filter_value = &amp;f-&gt;f_av_value;
        <br>
        ++        escaped = backsql_val_escape( bsi-&gt;bsi_op,
        filter_value, &amp;escval );
        <br>
        ++        if ( escaped )
        <br>
        ++            filter_value = &amp;escval;
        <br>
        +         /*
        <br>
        +          * maybe we should check type of at-&gt;sel_expr here
        somehow,
        <br>
        +          * to know whether upper_func is applicable, but for
        now
        <br>
        +          * upper_func stuff is made for Oracle, where UPPER is
        <br>
        +          * safely applicable to NUMBER etc.
        <br>
        +          */
        <br>
        +-        (void)backsql_process_filter_like( bsi, at, 1,
        &amp;f-&gt;f_av_value );
        <br>
        ++        (void)backsql_process_filter_like( bsi, at, 1,
        filter_value );
        <br>
        +         break;
        <br>
        +
        <br>
        +     default:
        <br>
        +@@ -1394,6 +1478,9 @@ equality_match:;
        <br>
        +
        <br>
        +     }
        <br>
        +
        <br>
        ++    if ( escaped )
        <br>
        ++        bsi-&gt;bsi_op-&gt;o_tmpfree( escval.bv_val,
        bsi-&gt;bsi_op-&gt;o_tmpmemctx );
        <br>
        ++
        <br>
        +     Debug( LDAP_DEBUG_TRACE,
        "&lt;==backsql_process_filter_attr(%s)\n",
        <br>
        +         at-&gt;bam_ad-&gt;ad_cname.bv_val, 0, 0 );
        <br>
        +
        <br>
        +--
        <br>
        +2.25.1
        <br>
        +
        <br>
        diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
        b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
        <br>
        index a282523a3..e3e9caa1b 100644
        <br>
        --- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
        <br>
        +++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
        <br>
        @@ -23,8 +23,8 @@ SRC_URI =
        "<a class="moz-txt-link-freetext" href="http://www.openldap.org/software/download/OpenLDAP/openldap-release/$">http://www.openldap.org/software/download/OpenLDAP/openldap-release/$</a>
        <br>
              <a class="moz-txt-link-freetext" href="file://thread_stub.patch">file://thread_stub.patch</a> \
        <br>
              <a class="moz-txt-link-freetext" href="file://openldap-CVE-2015-3276.patch">file://openldap-CVE-2015-3276.patch</a> \
        <br>
              <a class="moz-txt-link-freetext" href="file://remove-user-host-pwd-from-version.patch">file://remove-user-host-pwd-from-version.patch</a> \
        <br>
        +    <a class="moz-txt-link-freetext" href="file://CVE-2022-29155.patch">file://CVE-2022-29155.patch</a> \
        <br>
          "
        <br>
        -
        <br>
          SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
        <br>
          SRC_URI[sha256sum] =
        "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
        <br>
          <br>
        
        <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000ff">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
      </font></div>
  </body>
</html>

--------------iInamUUa3cNNZzAXIztUtjxy--

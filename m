Return-Path: <bounces+12060237-dea2-openembedded-core=lists.openembedded.org@sendgrid.net>
Received: from o1.f.az.sendgrid.net (o1.f.az.sendgrid.net [208.117.55.132])
	by mail.openembedded.org (Postfix) with ESMTP id 461367E502
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 22:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=sendgrid.me; 
	h=from:to:cc:subject:in-reply-to:references:mime-version:content-type; 
	s=smtpapi; bh=82t2cu5njd4qdy7yjzLxGY8B7YM=; b=GtmaYVI8WrNYo1TJwI
	5HzSXgApjCn+Dgq/BWaJOaskpzYaRenqU8A2OVABX3hqhHxB1FhMlrOO9VJzKRTU
	VfXYYDLoS+UgThNlsmjwYmBRMre2Wnk9tKfXaXm0uS4IqwvRo1AII2wwxfW20SmJ
	rpJOm/FyCW2EIT+yYDDWxQW8U=
Received: by filter0107p3las1.sendgrid.net with SMTP id
	filter0107p3las1-28326-5D533A0D-37
	2019-08-13 22:30:37.69685248 +0000 UTC m=+1567908.287140685
Received: from
	t-keweng-westus2-ubuntu.sthawock52fuzp14qwoa2ht3of.xx.internal.cloudapp.net
	(unknown [52.143.72.184])
	by ismtpd0005p1las1.sendgrid.net (SG) with ESMTP id
	szZZ6hY2ThWaVy_tj2zTMQ Tue, 13 Aug 2019 22:30:37.647 +0000 (UTC)
From: Kevin Weng <t-keweng@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 22:31:38 +0000 (UTC)
Message-Id: <20190813223031.40138-4-t-keweng@microsoft.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813223031.40138-1-t-keweng@microsoft.com>
References: <20190813223031.40138-1-t-keweng@microsoft.com>
MIME-Version: 1.0
X-SG-EID: NueaD3OYy6TFANBcuSZZzWeqNF8z73veS5dGPAsjLWggnA2yQn0uEn6uw+MVASYbIv8Ln8HS1dYB/s
	v3EmM4N/FxTvM53y0jKJDh5U7h5kI8pk0vEQNq7LeHEY9m1aWBDXJbV1ABZa9uh7oalB452hk36/6s
	G5KI5kSlwntaxNyWl7xbqba0YIvVXb0eVFUq/yr5tHw5g7mnm1SivFCD/zvZ4sQ/ebz8Y4RibW5900
	wkOpfTilCGmTYruYiVDVVq
Cc: Kevin Weng <t-keweng@microsoft.com>
Subject: [thud][PATCH 4/4] libcomps: fix CVE-2019-3817
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
X-List-Received-Date: Tue, 13 Aug 2019 22:36:41 -0000
Content-type: multipart/alternative; boundary="----------=_1565735438-2621-367"

------------=_1565735438-2621-367
content-transfer-encoding: quoted-printable

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
---=0D
 .../libcomps/libcomps/CVE-2019-3817.patch     | 97 +++++++++++++++++++=0D
 .../recipes-devtools/libcomps/libcomps_git.bb |  1 +=0D
 2 files changed, 98 insertions(+)=0D
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.p=
atch=0D
=0D
diff --git a/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch b/=
meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch=0D
new file mode 100644=0D
index 0000000000..b8cfb3c4db=0D
--- /dev/null=0D
+++ b/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch=0D
@@ -0,0 +1,97 @@=0D
+From cea10cd1f2ef6bb4edaac0c1d46d47bf237c42b8 Mon Sep 17 00:00:00 2001=0D
+From: Riccardo Schirone <rschiron@redhat.com>=0D
+Date: Mon, 21 Jan 2019 18:11:42 +0100=0D
+Subject: [PATCH] Fix UAF in comps_objmrtree_unite function=0D
+=0D
+The added field is not used at all in many places and it is probably the=
=0D
+left-over of some copy-paste.=0D
+=0D
+Upstream-Status: Backport=0D
+[https://u12060237.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsogh=
c-2F9RlLvhcpOjxb9ovgnr4YRBxmwFECTTjPS9PgQV84-2BUSEk9vEIRrUewVY024DakCb8CoJO=
oQbEEuIx0JtI-3D_TE0Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4w=
qVCgNIpo7dsW-2F-2BMliwfLhRhehxDxQEVAVjz-2B7rA-2FJAENANhR-2F6MZPVT-2BCzcQr03=
CBCKL19RuiyJjo1Ir8MQwBmEVs-2FImhHvCT5WfFHukDc-2FVeE2UO6hYfFWHVV9DDcXOiilszZ=
-2FXfOq3SLzYA8Fb2Yqg1HlodT-2B1oAdwEwgfU50AJ-2Bx6URUTp4ji5qBHXFLICP4SbDpvokE=
9b=0D
+/e3a5d056633677959ad924a51758876d415e7046]=0D
+=0D
+CVE: CVE-2019-3817=0D
+=0D
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>=0D
+---=0D
+ libcomps/src/comps_mradix.c    | 2 --=0D
+ libcomps/src/comps_objmradix.c | 2 --=0D
+ libcomps/src/comps_objradix.c  | 2 --=0D
+ libcomps/src/comps_radix.c     | 1 -=0D
+ 4 files changed, 7 deletions(-)=0D
+=0D
+diff --git a/libcomps/src/comps_mradix.c b/libcomps/src/comps_mradix.c=0D
+index 338cb07..6ceb7c9 100644=0D
+--- a/libcomps/src/comps_mradix.c=0D
++++ b/libcomps/src/comps_mradix.c=0D
+@@ -177,7 +177,6 @@ void comps_mrtree_unite(COMPS_MRTree *rt1, COMPS_MRTre=
e *rt2) {=0D
+     struct Pair {=0D
+         COMPS_HSList * subnodes;=0D
+         char * key;=0D
+-        char added;=0D
+     } *pair, *parent_pair;=0D
+ =0D
+     pair =3D malloc(sizeof(struct Pair));=0D
+@@ -195,7 +194,6 @@ void comps_mrtree_unite(COMPS_MRTree *rt1, COMPS_MRTre=
e *rt2) {=0D
+         parent_pair =3D (struct Pair*) it->data;=0D
+         free(it);=0D
+ =0D
+-        pair->added =3D 0;=0D
+         for (it =3D tmp_subnodes->first; it !=3D NULL; it=3Dit->next) {=
=0D
+             pair =3D malloc(sizeof(struct Pair));=0D
+             pair->subnodes =3D ((COMPS_MRTreeData*)it->data)->subnodes;=
=0D
+diff --git a/libcomps/src/comps_objmradix.c b/libcomps/src/comps_objmradix=
.c=0D
+index 9be6648..8771c89 100644=0D
+--- a/libcomps/src/comps_objmradix.c=0D
++++ b/libcomps/src/comps_objmradix.c=0D
+@@ -285,7 +285,6 @@ void comps_objmrtree_unite(COMPS_ObjMRTree *rt1, COMPS=
_ObjMRTree *rt2) {=0D
+     struct Pair {=0D
+         COMPS_HSList * subnodes;=0D
+         char * key;=0D
+-        char added;=0D
+     } *pair, *parent_pair;=0D
+ =0D
+     pair =3D malloc(sizeof(struct Pair));=0D
+@@ -303,7 +302,6 @@ void comps_objmrtree_unite(COMPS_ObjMRTree *rt1, COMPS=
_ObjMRTree *rt2) {=0D
+         parent_pair =3D (struct Pair*) it->data;=0D
+         free(it);=0D
+ =0D
+-        pair->added =3D 0;=0D
+         for (it =3D tmp_subnodes->first; it !=3D NULL; it=3Dit->next) {=
=0D
+             pair =3D malloc(sizeof(struct Pair));=0D
+             pair->subnodes =3D ((COMPS_ObjMRTreeData*)it->data)->subnodes=
;=0D
+diff --git a/libcomps/src/comps_objradix.c b/libcomps/src/comps_objradix.c=
=0D
+index a790270..0ebaf22 100644=0D
+--- a/libcomps/src/comps_objradix.c=0D
++++ b/libcomps/src/comps_objradix.c=0D
+@@ -692,7 +692,6 @@ void comps_objrtree_unite(COMPS_ObjRTree *rt1, COMPS_O=
bjRTree *rt2) {=0D
+     struct Pair {=0D
+         COMPS_HSList * subnodes;=0D
+         char * key;=0D
+-        char added;=0D
+     } *pair, *parent_pair;=0D
+ =0D
+     pair =3D malloc(sizeof(struct Pair));=0D
+@@ -711,7 +710,6 @@ void comps_objrtree_unite(COMPS_ObjRTree *rt1, COMPS_O=
bjRTree *rt2) {=0D
+         //printf("key-part:%s\n", parent_pair->key);=0D
+         free(it);=0D
+ =0D
+-        //pair->added =3D 0;=0D
+         for (it =3D tmp_subnodes->first; it !=3D NULL; it=3Dit->next) {=
=0D
+             pair =3D malloc(sizeof(struct Pair));=0D
+             pair->subnodes =3D ((COMPS_ObjRTreeData*)it->data)->subnodes;=
=0D
+diff --git a/libcomps/src/comps_radix.c b/libcomps/src/comps_radix.c=0D
+index ada4fda..05dcaf2 100644=0D
+--- a/libcomps/src/comps_radix.c=0D
++++ b/libcomps/src/comps_radix.c=0D
+@@ -529,7 +529,6 @@ void comps_rtree_unite(COMPS_RTree *rt1, COMPS_RTree *=
rt2) {=0D
+     struct Pair {=0D
+         COMPS_HSList * subnodes;=0D
+         char * key;=0D
+-        char added;=0D
+     } *pair, *parent_pair;=0D
+ =0D
+     pair =3D malloc(sizeof(struct Pair));=0D
+-- =0D
+2.22.0=0D
+=0D
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-=
devtools/libcomps/libcomps_git.bb=0D
index e69bf67729..b657f3377c 100644=0D
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb=0D
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb=0D
@@ -6,6 +6,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/libco=
mps.git \=0D
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.pat=
ch \=0D
            file://0002-Set-library-installation-path-correctly.patch \=0D
            file://0001-Make-__comps_objmrtree_all-static-inline.patch \=0D
+           file://CVE-2019-3817.patch \=0D
            "=0D
 =0D
 PV =3D "0.1.8+git${SRCPV}"=0D
-- =0D
2.22.0=0D


------------=_1565735438-2621-367
Content-Type: text/html
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<html><body>
<h3>Signed-off-by: Kevin Weng &lt;t-keweng@microsoft.com&gt;</h3>
<pre>.../libcomps/libcomps/CVE-2019-3817.patch     | 97 +++++++++++++++++++
.../recipes-devtools/libcomps/libcomps_git.bb |  1 +
2 files changed, 98 insertions(+)
create mode 100644 meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.pa=
tch</pre>
<p>diff --git a/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch=
 b/meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch new file mod=
e 100644 index 0000000000..b8cfb3c4db --- /dev/null +++ b/meta/recipes-devt=
ools/libcomps/libcomps/CVE-2019-3817.patch @@ -0,0 +1,97 @@ +From cea10cd1f=
2ef6bb4edaac0c1d46d47bf237c42b8 Mon Sep 17 00:00:00 2001 +From: Riccardo Sc=
hirone &lt;rschiron@redhat.com&gt; +Date: Mon, 21 Jan 2019 18:11:42 +0100 +=
Subject: [PATCH] Fix UAF in comps_objmrtree_unite function + +The added fie=
ld is not used at all in many places and it is probably the +left-over of s=
ome copy-paste. + +Upstream-Status: Backport +[<a href=3D"https://u12060237=
.ct.sendgrid.net/wf/click?upn=3DZUEdHBk4v9DOmlXxaQIXsoghc-2F9RlLvhcpOjxb9ov=
gnr4YRBxmwFECTTjPS9PgQV84-2BUSEk9vEIRrUewVY024DakCb8CoJOoQbEEuIx0JtI-3D_TE0=
Kxc-2FihH-2BEaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2F-2BM=
liwfLhRhehxDxQEVAVjz-2B7rA-2FJAENANhR-2F6MZPVT-2B51qhvqGET2Vty0BwL81IUeQiJJ=
uk4zpE2Fg3QQXVWpDE6FNrhfgq5VY6L2pPS04PDp19o96ktLgvmwqmPp1h0mq44BE56gMNN69lP=
v7N4SpL24Mg8fGsZ-2F2Q2KfqiP6s7uodDz8TisRft4onVRDNa">https://github.com/rpm-=
software-management/libcomps/commit</a> +/e3a5d056633677959ad924a51758876d4=
15e7046] + +CVE: CVE-2019-3817 + +Signed-off-by: Kevin Weng &lt;t-keweng@mi=
crosoft.com&gt; +--- + libcomps/src/comps_mradix.c    | 2 &mdash; + libcomp=
s/src/comps_objmradix.c | 2 &mdash; + libcomps/src/comps_objradix.c  | 2 &m=
dash; + libcomps/src/comps_radix.c     | 1 &ndash; + 4 files changed, 7 del=
etions(-) + +diff --git a/libcomps/src/comps_mradix.c b/libcomps/src/comps_=
mradix.c +index 338cb07..6ceb7c9 100644 +--- a/libcomps/src/comps_mradix.c =
++++ b/libcomps/src/comps_mradix.c +@@ -177,7 +177,6 @@ void comps_mrtree_u=
nite(COMPS_MRTree <strong>rt1, COMPS_MRTree <strong>rt2) { +     struct Pai=
r { +         COMPS_HSList * subnodes; +         char * key; +-        char=
 added; +     } *pair, *parent_pair; + +     pair =3D malloc(sizeof(struct =
Pair)); +@@ -195,7 +194,6 @@ void comps_mrtree_unite(COMPS_MRTree *rt1, COM=
PS_MRTree *rt2) { +         parent_pair =3D (struct Pair</strong>) it-&gt;d=
ata; +         free(it); + +-        pair-&gt;added =3D 0; +         for (i=
t =3D tmp_subnodes-&gt;first; it !=3D NULL; it=3Dit-&gt;next) { +          =
   pair =3D malloc(sizeof(struct Pair)); +             pair-&gt;subnodes =
=3D ((COMPS_MRTreeData*)it-&gt;data)-&gt;subnodes; +diff --git a/libcomps/s=
rc/comps_objmradix.c b/libcomps/src/comps_objmradix.c +index 9be6648..8771c=
89 100644 +--- a/libcomps/src/comps_objmradix.c ++++ b/libcomps/src/comps_o=
bjmradix.c +@@ -285,7 +285,6 @@ void comps_objmrtree_unite(COMPS_ObjMRTree =
*rt1, COMPS_ObjMRTree *rt2) { +     struct Pair { +         COMPS_HSList * =
subnodes; +         char * key; +-        char added; +     } *pair, *paren=
t_pair; + +     pair =3D malloc(sizeof(struct Pair)); +@@ -303,7 +302,6 @@ =
void comps_objmrtree_unite(COMPS_ObjMRTree *rt1, COMPS_ObjMRTree *rt2) { + =
        parent_pair =3D (struct Pair</strong>) it-&gt;data; +         free(=
it); + +-        pair-&gt;added =3D 0; +         for (it =3D tmp_subnodes-&=
gt;first; it !=3D NULL; it=3Dit-&gt;next) { +             pair =3D malloc(s=
izeof(struct Pair)); +             pair-&gt;subnodes =3D ((COMPS_ObjMRTreeD=
ata*)it-&gt;data)-&gt;subnodes; +diff --git a/libcomps/src/comps_objradix.c=
 b/libcomps/src/comps_objradix.c +index a790270..0ebaf22 100644 +--- a/libc=
omps/src/comps_objradix.c ++++ b/libcomps/src/comps_objradix.c +@@ -692,7 +=
692,6 @@ void comps_objrtree_unite(COMPS_ObjRTree *rt1, COMPS_ObjRTree *rt2=
) { +     struct Pair { +         COMPS_HSList * subnodes; +         char *=
 key; +-        char added; +     } *pair, *parent_pair; + +     pair =3D m=
alloc(sizeof(struct Pair)); +@@ -711,7 +710,6 @@ void comps_objrtree_unite(=
COMPS_ObjRTree *rt1, COMPS_ObjRTree *rt2) { +         //printf(&quot;key-pa=
rt:%s\n&quot;, parent_pair-&gt;key); +         free(it); + +-        //pair=
-&gt;added =3D 0; +         for (it =3D tmp_subnodes-&gt;first; it !=3D NUL=
L; it=3Dit-&gt;next) { +             pair =3D malloc(sizeof(struct Pair)); =
+             pair-&gt;subnodes =3D ((COMPS_ObjRTreeData*)it-&gt;data)-&gt;=
subnodes; +diff --git a/libcomps/src/comps_radix.c b/libcomps/src/comps_rad=
ix.c +index ada4fda..05dcaf2 100644 +--- a/libcomps/src/comps_radix.c ++++ =
b/libcomps/src/comps_radix.c +@@ -529,7 +529,6 @@ void comps_rtree_unite(CO=
MPS_RTree *rt1, COMPS_RTree *rt2) { +     struct Pair { +         COMPS_HSL=
ist * subnodes; +         char * key; +-        char added; +     } *pair, =
*parent_pair; + +     pair =3D malloc(sizeof(struct Pair)); +-- +2.22.0 + d=
iff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-d=
evtools/libcomps/libcomps_git.bb index e69bf67729..b657f3377c 100644 --- a/=
meta/recipes-devtools/libcomps/libcomps_git.bb +++ b/meta/recipes-devtools/=
libcomps/libcomps_git.bb @@ -6,6 +6,7 @@ SRC_URI =3D &quot;git://github.com=
/rpm-software-management/libcomps.git \</p>
<pre>file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
file://0002-Set-library-installation-path-correctly.patch \
file://0001-Make-__comps_objmrtree_all-static-inline.patch \</pre>
<p>+           <a href=3D"file://CVE-2019-3817.patch">file://CVE-2019-3817.=
patch</a> \</p>
<pre>           "

PV =3D "0.1.8+git${SRCPV}"</pre>
<p>&mdash; 2.22.0</p>

<img src=3D"https://u12060237.ct.sendgrid.net/wf/open?upn=3DTE0Kxc-2FihH-2B=
EaJFZv0piOBm40-2F8jB5b-2FHzeWxsyZzZlOtbMQm4wqVCgNIpo7dsW-2F-2BMliwfLhRhehxD=
xQEVAVjz-2B7rA-2FJAENANhR-2F6MZPVT8q9lYz12fX3gDBfifCOUCjA5FI-2BjwOsaO7N5lUu=
7WQV1GhlVwLuSPbzoML0Zucs7fT-2BMUrF7sGQFfDz4bH80ZxyXbKs1WrT2LsFWivvsEETN139C=
EyysTAO3h6vY4uRtpI5tD1yE65lGrABj9dBgtm" alt=3D"" width=3D"1" height=3D"1" b=
order=3D"0" style=3D"height:1px !important;width:1px !important;border-widt=
h:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-ri=
ght:0 !important;margin-left:0 !important;padding-top:0 !important;padding-=
bottom:0 !important;padding-right:0 !important;padding-left:0 !important;"/>
</body></html>

------------=_1565735438-2621-367--

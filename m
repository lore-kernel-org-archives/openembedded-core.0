Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 878A473232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 11 Mar 2016 05:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975508"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:07:07 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:30 +0200
Message-Id: <904212e23189d71e1975cbe2fbf416ec57970572.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 11/12] connman-gnome: Upgrade to JKU
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
X-List-Received-Date: Fri, 11 Mar 2016 13:07:07 -0000

This is the GTK3 version.

Drop patches and images that are now included upstream.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../connman-gnome-fix-dbus-interface-name.patch    | 187 ---------------------
 .../connman-gnome/images/connman-signal-01.png     | Bin 490 -> 0 bytes
 .../connman-gnome/images/connman-signal-02.png     | Bin 496 -> 0 bytes
 .../connman-gnome/images/connman-signal-03.png     | Bin 492 -> 0 bytes
 .../connman-gnome/images/connman-signal-04.png     | Bin 470 -> 0 bytes
 .../connman-gnome/images/connman-signal-05.png     | Bin 419 -> 0 bytes
 .../connman/connman-gnome_0.7.bb                   |  12 +-
 7 files changed, 3 insertions(+), 196 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png

diff --git a/meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch b/meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
deleted file mode 100644
index f4049fa..0000000
--- a/meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
+++ /dev/null
@@ -1,187 +0,0 @@
-connman-gnome: fix dbus interface name
-
-This patch resolves following error:
-
-"connman-dbus.xml": "connman" is not a valid D-Bus interface name
-
-https://502552.bugs.gentoo.org/attachment.cgi?id=380652
-
-Upstream-Status: Backport
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- common/connman-client.c | 24 ++++++++++++------------
- common/connman-client.h |  4 ++--
- common/connman-dbus.c   |  6 +++---
- common/connman-dbus.xml |  2 +-
- 4 files changed, 18 insertions(+), 18 deletions(-)
-
-diff --git a/common/connman-client.c b/common/connman-client.c
-index c55e25c..9d818b2 100644
---- a/common/connman-client.c
-+++ b/common/connman-client.c
-@@ -289,7 +289,7 @@ gboolean connman_client_set_ipv4(ConnmanClient *client, const gchar *device,
- 
- 	g_value_init(&value, DBUS_TYPE_G_DICTIONARY);
- 	g_value_set_boxed(&value, ipv4);
--	ret = connman_set_property(proxy, "IPv4.Configuration", &value, NULL);
-+	ret = net_connman_set_property(proxy, "IPv4.Configuration", &value, NULL);
- 
- 	g_object_unref(proxy);
- 
-@@ -317,7 +317,7 @@ void connman_client_set_powered(ConnmanClient *client, const gchar *device,
- 	g_value_set_boolean(&value, powered);
- 
- 	error = NULL;
--	connman_set_property(proxy, "Powered", &value, &error);
-+	net_connman_set_property(proxy, "Powered", &value, &error);
- 	if( error )
- 		fprintf (stderr, "error: %s\n", error->message);
- 
-@@ -325,7 +325,7 @@ void connman_client_set_powered(ConnmanClient *client, const gchar *device,
- }
- 
- void connman_client_scan(ConnmanClient *client, const gchar *device,
--						connman_scan_reply callback, gpointer user_data)
-+						net_connman_scan_reply callback, gpointer user_data)
- {
- 	ConnmanClientPrivate *priv = CONNMAN_CLIENT_GET_PRIVATE(client);
- 	DBusGProxy *proxy;
-@@ -339,7 +339,7 @@ void connman_client_scan(ConnmanClient *client, const gchar *device,
- 	if (proxy == NULL)
- 		return;
- 
--	connman_scan_async(proxy, callback, user_data);
-+	net_connman_scan_async(proxy, callback, user_data);
- 
- 	g_object_unref(proxy);
- }
-@@ -353,7 +353,7 @@ gboolean connman_client_get_offline_status(ConnmanClient *client)
- 
- 	DBG("client %p", client);
- 
--	ret = connman_get_properties(priv->manager, &hash, NULL);
-+	ret = net_connman_get_properties(priv->manager, &hash, NULL);
- 
- 	if (ret == FALSE)
- 		goto done;
-@@ -375,7 +375,7 @@ void connman_client_set_offlinemode(ConnmanClient *client, gboolean status)
- 	g_value_init(&value, G_TYPE_BOOLEAN);
- 	g_value_set_boolean(&value, status);
- 
--	connman_set_property(priv->manager, "OfflineMode", &value, NULL);
-+	net_connman_set_property(priv->manager, "OfflineMode", &value, NULL);
- }
- 
- static gboolean network_disconnect(GtkTreeModel *model, GtkTreePath *path,
-@@ -398,7 +398,7 @@ static gboolean network_disconnect(GtkTreeModel *model, GtkTreePath *path,
- 		return TRUE;
- 
- 	if (type == CONNMAN_TYPE_WIFI)
--		connman_disconnect(proxy, NULL);
-+		net_connman_disconnect(proxy, NULL);
- 
- 	g_object_unref(proxy);
- 
-@@ -422,13 +422,13 @@ void connman_client_connect(ConnmanClient *client, const gchar *network)
- 	if (proxy == NULL)
- 		return;
- 
--	connman_connect(proxy, NULL);
-+	net_connman_connect(proxy, NULL);
- 
- 	g_object_unref(proxy);
- }
- 
- void connman_client_connect_async(ConnmanClient *client, const gchar *network,
--		connman_connect_reply callback, gpointer userdata)
-+		net_connman_connect_reply callback, gpointer userdata)
- {
- 	ConnmanClientPrivate *priv = CONNMAN_CLIENT_GET_PRIVATE(client);
- 	DBusGProxy *proxy;
-@@ -446,7 +446,7 @@ void connman_client_connect_async(ConnmanClient *client, const gchar *network,
- 	if (proxy == NULL)
- 		goto done;
- 
--	connman_connect_async(proxy, callback, userdata);
-+	net_connman_connect_async(proxy, callback, userdata);
- 
- done:
- 	return;
-@@ -476,7 +476,7 @@ void connman_client_disconnect(ConnmanClient *client, const gchar *network)
- 	if (proxy == NULL)
- 		return;
- 
--	connman_disconnect(proxy, NULL);
-+	net_connman_disconnect(proxy, NULL);
- 
- 	g_object_unref(proxy);
- }
-@@ -532,7 +532,7 @@ void connman_client_remove(ConnmanClient *client, const gchar *network)
- 	if (proxy == NULL)
- 		return;
- 
--	connman_remove(proxy, NULL);
-+	net_connman_remove(proxy, NULL);
- 
- 	g_object_unref(proxy);
- }
-diff --git a/common/connman-client.h b/common/connman-client.h
-index 9e2e6d5..98241de 100644
---- a/common/connman-client.h
-+++ b/common/connman-client.h
-@@ -70,13 +70,13 @@ void connman_client_set_powered(ConnmanClient *client, const gchar *device,
- gboolean connman_client_set_ipv4(ConnmanClient *client, const gchar *device,
- 				struct ipv4_config *ipv4_config);
- void connman_client_scan(ConnmanClient *client, const gchar *device,
--							connman_scan_reply callback, gpointer user_data);
-+							net_connman_scan_reply callback, gpointer user_data);
- 
- void connman_client_connect(ConnmanClient *client, const gchar *network);
- void connman_client_disconnect(ConnmanClient *client, const gchar *network);
- gchar *connman_client_get_security(ConnmanClient *client, const gchar *network);
- void connman_client_connect_async(ConnmanClient *client, const gchar *network,
--				connman_connect_reply callback, gpointer userdata);
-+				net_connman_connect_reply callback, gpointer userdata);
- void connman_client_set_remember(ConnmanClient *client, const gchar *network,
- 							gboolean remember);
- 
-diff --git a/common/connman-dbus.c b/common/connman-dbus.c
-index b82b3e1..543eb43 100644
---- a/common/connman-dbus.c
-+++ b/common/connman-dbus.c
-@@ -655,15 +655,15 @@ DBusGProxy *connman_dbus_create_manager(DBusGConnection *conn,
- 
- 	DBG("getting manager properties");
- 
--	connman_get_properties_async(proxy, manager_properties, store);
-+	net_connman_get_properties_async(proxy, manager_properties, store);
- 
- 	DBG("getting technologies");
- 
--	connman_get_technologies_async(proxy, manager_technologies, store);
-+	net_connman_get_technologies_async(proxy, manager_technologies, store);
- 
- 	DBG("getting services");
- 
--	connman_get_services_async(proxy, manager_services, store);
-+	net_connman_get_services_async(proxy, manager_services, store);
- 
- 	return proxy;
- }
-diff --git a/common/connman-dbus.xml b/common/connman-dbus.xml
-index 56b9582..0199d52 100644
---- a/common/connman-dbus.xml
-+++ b/common/connman-dbus.xml
-@@ -1,7 +1,7 @@
- <?xml version="1.0" encoding="UTF-8" ?>
- 
- <node name="/">
--  <interface name="connman">
-+  <interface name="net.connman">
-     <method name="GetProperties">
-       <arg type="a{sv}" direction="out"/>
-     </method>
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-01.png
deleted file mode 100644
index 33247c1e2db4304e48ea0a6145be4de6e420882b..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 490
zcmV<G0Tup<P)<h;3K|Lk000e1NJLTq000&M000&U1^@s6#I$TX00006VoOIv0RI60
z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)Cvt2G&}Dr@$>)y03CEi
zSad^gZEa<4bO1wgWnpw>WFU8GbZ8({Xk{QrNlj4iWF>9@00B-(L_t(I%k5O5PD4Qu
zoZXqdq)#-6CMbeI5`w`$RU9NZf<X`@|AHhTL4hLyM{3F^@J9~;@3_|%O7kEX*6rQx
z?C#9o0{`~gW<BGlGk)D-s&8f2SC_Q`Xv}bSev!|611l1?clPGbd$hg_;6(~J383i(
zjJw;L+TNu(J~@RV;BK%PxmE@a1vWOfGK`c!=gL&fw;loMBP=37cfeMx`0?SshBYua
z4i1k%CQyPkZ=8}X$193Q38T?^L4}|~EQR3oS?%V4r)|smfdY{N*0hNNEGi`9dmK+D
zPiqF$4GiP){<A2gNGKDPz@k8RG`0j-N*E4@g)gLt{QDUKrA!4S7zxKxV4<q2>^p^s
zl(&k(AZMpSch6#eDc+!}fZ}1K=-j)yKaK9+n~G{M==dq6ZV*}K?Qs6t+AOD{GaU<T
g(S7{`tN4%X6`T(*H@KiqK>z>%07*qoM6N<$g7W0Y-2eap

diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-02.png
deleted file mode 100644
index a94fb952ff6cbea25b06c261267fe9a82d77f981..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 496
zcmV<M0T2F(P)<h;3K|Lk000e1NJLTq000&M000&U1^@s6#I$TX00006VoOIv0RI60
z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)Cvt2G$Z^+X`%oC03CEi
zSad^gZEa<4bO1wgWnpw>WFU8GbZ8({Xk{QrNlj4iWF>9@00C4<L_t(I%k5M#N(4a=
ztnRL!*x<lOOfD2LG2a&`n287mV(1GD{eYn$7>H(q=E52H03YB>)SEHT9cOP(@0L|e
z?5t<EYpScd2l$WQ4(VAxn#ijflYN<;ot{(zAc<iA;4q)}2BrtBtgg4ud$hg=;E{Bw
z8GzIa7+06)m3&yUy|V|pLscLXc6A1JI+m7)8HNlnwa!wsTXzTfS?2CARX{p2zP-7w
zAPEA+#^x5x0*r*DcTLS|jXRoWBnE@ULJER~S#&~8C%tO{kLs554|I5NNUAS#Si#WD
z=hOK3;%VVygK)Gvyr&Vt1Imj^U>aenNHT{MccX^_hzRa^`^^a>vlK=`%%HOv#~2aE
z&pB5k+(Uj<1Olox7^-SE^Go1yOc=kuG-o$>BUd&z%~WS=9Aj(&hY*@YW+(~TlyQ@9
mrlK(&Q)1fp>Ia_UKZ-X`7C)%O7ejFX0000<MNUMnLSTZlN5kg;

diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-03.png
deleted file mode 100644
index b5eb405a9009722025c1e93e233f8dec676ff9fd..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 492
zcmV<I0Tcd-P)<h;3K|Lk000e1NJLTq000&M000&U1^@s6#I$TX00006VoOIv0RI60
z0RN!9r;`8x010qNS#tmY3ljhU3ljkVnw%H_000McNliru)Cvt2GzlmCpmYEL03CEi
zSad^gZEa<4bO1wgWnpw>WFU8GbZ8({Xk{QrNlj4iWF>9@00B@*L_t(I%k5M<PQySD
zee+Ar1rSY2glOn}4TK_5AWBY<G8dpkLZXPsDL|n>v~Yl2Byo0@g7~v`APEN1FxBkX
z^YrGu*#-XNw}U$NPaEf~z|^kHZf~wL0uYICad}nNI|HlraCmgmu6G#y7{HsVfkgns
zPQaMl-(|G2=Jf0wY6fNkHSF3M*wnCp&@W+Bdk~hLrD%_C2Gy#~%plAF?Z|jEo@GTo
z9P}a5gQ$Yyho&Nh#@{gS@#VE9g+gm)sVP{v>0JwWT8x}jeOacW2B|R=vF$V-jc0qS
z8-(GY|Kt&f%e-o60IMj38IiV-;$iw+=FtOUm{$x<A*!Vmq6!iLZ({83@UW=P0a)gX
z+T%h{mV_ZQmu7wn96Tb_Mt66F`8@fDHN9!Vyjf#+Pk;j=@;n7r5!4CFnsuWuwxYcq
iX{`I6{lHWFNAV8gNn5(2{=AI<0000<MNUMnLSTYw4$qnZ

diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-04.png
deleted file mode 100644
index be54419fa74db126c4039c27566584e5b4d5c26e..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 470
zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
z3=G`DAk4@xYmNj^kiEpy*OmPW7q6HxgJ5ExI8aEo#5JPCIX^cyHLrxhxhOTUBsE2$
zJhLQ2AtWPJ!QIn0;C+f}9s>iTm8Xkih{fr*A%=cO3<PA}-wOZSp)I&*;d%FU&Qtb0
zIQ5%BRp@RlGY4yc;z8zjvIU-RVx@$R^98-rQ;=GA>ei=}va*~9^80y>Ki15=>UuhJ
zxz_HT`?Po%Oxd1`Prv&sCFymVg`K7JI{%EnA_rz~<vYUTpe~ra^`6Mv??r~~rF<@I
zYSPyo!|vGcbz!n*7Ji?5bU`UYfN<xW;sm7wZ&q65+p-tG{>XTEcXgfbVR<KgQL!Ua
z&gVJAe2adkV5fOCV^M{AfB5UO7q9akDl)7WV7+4gQC_Lx3&)M7&IM`g+Igpsukd3s
z35k{6!;~m38qIx}M=DrHX+pqpD~5e5C)d7z{e(yG;ENNioQpUjUoU*6*>>pqZ4*hC
z$8y~sPBIHJW_hfM3*1|uGV$@n^v(0T60L%2w#WZD5d6pe2Meo5@q`BPx+q|9GkCiC
KxvX<aXaWH74zpnZ

diff --git a/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png b/meta/recipes-connectivity/connman/connman-gnome/images/connman-signal-05.png
deleted file mode 100644
index 1c40ac9a10bcf50c437c8cae475441b5900cfb16..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 419
zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
z3=G`DAk4@xYmNj^kiEpy*OmPW7q6JHX7FXPYM_v8iEBiObAE1aYF-J0b5UwyNotBh
zd1gt5LP$ocg1e`0!21-{JO&0vc25__5R22v2@<T$vTxiE|6iF_aQcz;|HK)u*sPc6
zGbelTxPALpy-KR*S?MdOH&Zq;^=$m`Kln-M@iSKwdRqU_S6Ux@Hld_>&ZV#h!;bq~
zI9mV9&%b_OnVs>*gD+1LdV25g_+V!A-~M78`_2=Jm4Xt@Ke_Y&mixr=9aE_L`)Brv
znm=sTD!L5G8@k2r{K=nhAl-A2?JTR*6chO#$3M4rUZ41L2QS;s6MA)G5{G#<_08it
zme8CQ|36>aTo|a})l7|=J8aE++VUp2ddN#O{|Mc@{_pml85}^<pMF_=0xX#(Xvf%-
z$R_!Fd$Zvg1?ByG2FDJmYlZGP9;B0$A`vAz`wKh6`;%#{4eK4Y1H+EN)78&qol`;+
E04bEH<^TWy

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 7b875f0..d10ee25 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -6,15 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
 
-DEPENDS = "gtk+ dbus-glib intltool-native gettext-native"
+DEPENDS = "gtk+3 dbus-glib intltool-native gettext-native"
 
 # 0.7 tag
-SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI = "git://github.com/connectivity/connman-gnome.git \
+SRCREV = "a59b0fac02e74a971ac3f08bf28c17ce361a9526"
+SRC_URI = "git://github.com/jku/connman-gnome.git;branch=gtk3 \
            file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
            file://null_check_for_ipv4_config.patch \
-           file://images/* \
-           file://connman-gnome-fix-dbus-interface-name.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -23,7 +21,3 @@ inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
 RDEPENDS_${PN} = "connman"
-
-do_install_append() {
-    install -m 0644 ${WORKDIR}/images/* ${D}/usr/share/icons/hicolor/22x22/apps/
-}
-- 
2.1.4



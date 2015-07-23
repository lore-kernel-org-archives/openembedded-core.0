Return-Path: <jatedev@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 645C2761D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 21:32:28 +0000 (UTC)
Received: by oige126 with SMTP id e126so5755780oig.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Ma0VCPU+V9Tb4NJMKlktvhzyY/xDjW1zwh7dcbUzbOQ=;
	b=obdwh80jpMfmOtx38hyTOqUkvt8Td53fPrmxp8Ab5B87YxPxKhuE3MFcczpnsTAf8H
	nOpxRnoIU5uY30h7GY+FokD199VbDVnCFchzQ8/LKd6drCetNOp+OKr2jVC7uIRfZMN2
	rUaEqxHaQ+9N+2w5ae6XahyicZU4gR7gdEuneU/S9HokOcFqgNFrmoEL/RrJL+hRl9kT
	PEjKIvPZU7n7159kJvkLYIP77pkL664vl+so2kAm+TSPIs00TBl0sSGWJIlns7u/0O5f
	9+hZorchV8L1pO/jWFaF+LezLtEInHgrJQsa4HRCl+AdkEbTo527aBGX48HbDEhI/Wy8
	DA3g==
MIME-Version: 1.0
X-Received: by 10.182.86.72 with SMTP id n8mr12169702obz.9.1437687149332; Thu,
	23 Jul 2015 14:32:29 -0700 (PDT)
Received: by 10.76.156.130 with HTTP; Thu, 23 Jul 2015 14:32:29 -0700 (PDT)
Date: Thu, 23 Jul 2015 17:32:29 -0400
Message-ID: <CAPphmgaY0YzB0G+onMyYYcMq7kttU_McyHH6Ut9zt-6BbRD5VQ@mail.gmail.com>
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3][2/2] image.bbclass: Add support for runtime PREFERRED_PROVIDER
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
X-List-Received-Date: Thu, 23 Jul 2015 21:32:30 -0000
Content-Type: multipart/alternative; boundary=089e0149bc1ad58f10051b919f9c

--089e0149bc1ad58f10051b919f9c
Content-Type: text/plain; charset=UTF-8

The following changes since commit 5f248526ae5f15a2e6f3a6da88a96aba976bb28e:

  providers.py: Add support for preferred runtime item (2015-07-23 17:28:31
-0400)

are available in the git repository at:

  https://jatedev@github.com/jatedev/poky preferred-provider-runtime-3

for you to fetch changes up to 6ade6807288ad318355bb77e43df87dfc15a9e90:

  image.bbclass: Add support for runtime PREFERRED_PROVIDER (2015-07-23
17:29:04 -0400)

----------------------------------------------------------------
Jate Sujjavanich (1):
      image.bbclass: Add support for runtime PREFERRED_PROVIDER

 meta/classes/image.bbclass |   49
++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 01f8b3f..2276897 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -132,6 +132,25 @@ inherit ${IMAGE_TYPE_live}
 IMAGE_TYPE_vmdk = '${@bb.utils.contains("IMAGE_FSTYPES", "vmdk",
"image-vmdk", "", d)}'
 inherit ${IMAGE_TYPE_vmdk}

+def packageinfo(d):
+    import oe.packagedata
+    pkginfolist = []
+
+    pkgdata_dir = d.getVar("PKGDATA_DIR", True) + '/runtime/'
+    if os.path.exists(pkgdata_dir):
+        for root, dirs, files in os.walk(pkgdata_dir):
+            for pkgname in files:
+                if pkgname.endswith('.packaged'):
+                    pkgname = pkgname[:-9]
+                    pkgdatafile = root + pkgname
+                    try:
+                        sdata =
oe.packagedata.read_pkgdatafile(pkgdatafile)
+                        sdata['PKG'] = pkgname
+                        pkginfolist.append(sdata)
+                    except Exception as e:
+                        bb.warn("Failed to read pkgdata file %s: %s: %s" %
(pkgdatafile, e.__class__, str(e)))
+    return pkginfolist
+
 python () {
     deps = " " + imagetypes_getdepends(d)
     d.appendVarFlag('do_rootfs', 'depends', deps)
@@ -283,6 +302,36 @@ python rootfs_process_ignore() {
 }
 do_rootfs[prefuncs] += "rootfs_process_ignore"

+python rootfs_process_prefer() {
+    packageinfolist = packageinfo(d)
+
+    inst_pkgs = d.getVar("PACKAGE_INSTALL", True).split()
+    pref_pkgs = list()
+    for pkg in inst_pkgs:
+        prefer_var = d.getVar("PREFERRED_PROVIDER_%s" % pkg, True)
+        if prefer_var:
+            bb.note("%s rprovided by recipe %s" % (pkg, prefer_var))
+            # Find preferred package which provides item
+            for p in packageinfolist:
+                # First Look for PN and RPROVIDES_${PN}
+                if p['PN'] == prefer_var:
+                    var = 'RPROVIDES_%s' % p['PKG']
+                    try:
+                        val = p[var]
+                    except KeyError:
+                        continue
+                    rprovides_split = val.split(' ')
+                    if pkg in rprovides_split:
+                        bb.note('%s in %s. Will substitute in
PACKAGE_INSTALL' % (pkg, var))
+                        inst_pkgs.remove(pkg)
+                        pref_pkgs.append(p['PKG'])
+            inst_pkgs.extend(pref_pkgs)
+            for p in inst_pkgs:
+                bb.note("%s " % p)
+            d.setVar("PACKAGE_INSTALL", ' '.join(inst_pkgs))
+}
+do_rootfs[prefuncs] += "rootfs_process_prefer"
+
 # We have to delay the runtime_mapping_rename until just before rootfs runs
 # otherwise, the multilib renaming could step in and squash any fixups that
 # may have occurred.

--089e0149bc1ad58f10051b919f9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA1ZjI0ODUy
NmFlNWYxNWEyZTZmM2E2ZGE4OGE5NmFiYTk3NmJiMjhlOjxicj48YnI+wqAgcHJvdmlkZXJzLnB5
OiBBZGQgc3VwcG9ydCBmb3IgcHJlZmVycmVkIHJ1bnRpbWUgaXRlbSAoMjAxNS0wNy0yMyAxNzoy
ODozMSAtMDQwMCk8YnI+PGJyPmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0
Ojxicj48YnI+wqAgPGEgaHJlZj0iaHR0cHM6Ly9qYXRlZGV2QGdpdGh1Yi5jb20vamF0ZWRldi9w
b2t5Ij5odHRwczovL2phdGVkZXZAZ2l0aHViLmNvbS9qYXRlZGV2L3Bva3k8L2E+IHByZWZlcnJl
ZC1wcm92aWRlci1ydW50aW1lLTM8YnI+PGJyPmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byA2YWRlNjgwNzI4OGFkMzE4MzU1YmI3N2U0M2RmODdkZmMxNWE5ZTkwOjxicj48YnI+wqAgaW1h
Z2UuYmJjbGFzczogQWRkIHN1cHBvcnQgZm9yIHJ1bnRpbWUgUFJFRkVSUkVEX1BST1ZJREVSICgy
MDE1LTA3LTIzIDE3OjI5OjA0IC0wNDAwKTxicj48YnI+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj5KYXRlIFN1amphdmFu
aWNoICgxKTo8YnI+wqDCoMKgwqDCoCBpbWFnZS5iYmNsYXNzOiBBZGQgc3VwcG9ydCBmb3IgcnVu
dGltZSBQUkVGRVJSRURfUFJPVklERVI8YnI+PGJyPsKgbWV0YS9jbGFzc2VzL2ltYWdlLmJiY2xh
c3MgfMKgwqAgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKys8
YnI+wqAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKTxicj48YnI+ZGlmZiAtLWdpdCBh
L21ldGEvY2xhc3Nlcy9pbWFnZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL2ltYWdlLmJiY2xhc3M8
YnI+aW5kZXggMDFmOGIzZi4uMjI3Njg5NyAxMDA2NDQ8YnI+LS0tIGEvbWV0YS9jbGFzc2VzL2lt
YWdlLmJiY2xhc3M8YnI+KysrIGIvbWV0YS9jbGFzc2VzL2ltYWdlLmJiY2xhc3M8YnI+QEAgLTEz
Miw2ICsxMzIsMjUgQEAgaW5oZXJpdCAke0lNQUdFX1RZUEVfbGl2ZX08YnI+wqBJTUFHRV9UWVBF
X3ZtZGsgPSAmIzM5OyR7QGJiLnV0aWxzLmNvbnRhaW5zKCZxdW90O0lNQUdFX0ZTVFlQRVMmcXVv
dDssICZxdW90O3ZtZGsmcXVvdDssICZxdW90O2ltYWdlLXZtZGsmcXVvdDssICZxdW90OyZxdW90
OywgZCl9JiMzOTs8YnI+wqBpbmhlcml0ICR7SU1BR0VfVFlQRV92bWRrfTxicj7CoDxicj4rZGVm
IHBhY2thZ2VpbmZvKGQpOjxicj4rwqDCoMKgIGltcG9ydCBvZS5wYWNrYWdlZGF0YTxicj4rwqDC
oMKgIHBrZ2luZm9saXN0ID0gW108YnI+Kzxicj4rwqDCoMKgIHBrZ2RhdGFfZGlyID0gZC5nZXRW
YXIoJnF1b3Q7UEtHREFUQV9ESVImcXVvdDssIFRydWUpICsgJiMzOTsvcnVudGltZS8mIzM5Ozxi
cj4rwqDCoMKgIGlmIG9zLnBhdGguZXhpc3RzKHBrZ2RhdGFfZGlyKTo8YnI+K8KgwqDCoMKgwqDC
oMKgIGZvciByb290LCBkaXJzLCBmaWxlcyBpbiBvcy53YWxrKHBrZ2RhdGFfZGlyKTo8YnI+K8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIHBrZ25hbWUgaW4gZmlsZXM6PGJyPivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgcGtnbmFtZS5lbmRzd2l0aCgmIzM5Oy5wYWNrYWdlZCYj
Mzk7KTo8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBrZ25hbWUg
PSBwa2duYW1lWzotOV08YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHBrZ2RhdGFmaWxlID0gcm9vdCArIHBrZ25hbWU8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHRyeTo8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2RhdGEgPSBvZS5wYWNrYWdlZGF0YS5yZWFkX3BrZ2RhdGFmaWxlKHBr
Z2RhdGFmaWxlKTxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzZGF0YVsmIzM5O1BLRyYjMzk7XSA9IHBrZ25hbWU8YnI+K8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGtnaW5mb2xpc3QuYXBwZW5kKHNkYXRhKTxi
cj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXhjZXB0IEV4Y2VwdGlv
biBhcyBlOjxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBiYi53YXJuKCZxdW90O0ZhaWxlZCB0byByZWFkIHBrZ2RhdGEgZmlsZSAlczogJXM6ICVzJnF1
b3Q7ICUgKHBrZ2RhdGFmaWxlLCBlLl9fY2xhc3NfXywgc3RyKGUpKSk8YnI+K8KgwqDCoCByZXR1
cm4gcGtnaW5mb2xpc3Q8YnI+Kzxicj7CoHB5dGhvbiAoKSB7PGJyPsKgwqDCoMKgIGRlcHMgPSAm
cXVvdDsgJnF1b3Q7ICsgaW1hZ2V0eXBlc19nZXRkZXBlbmRzKGQpPGJyPsKgwqDCoMKgIGQuYXBw
ZW5kVmFyRmxhZygmIzM5O2RvX3Jvb3RmcyYjMzk7LCAmIzM5O2RlcGVuZHMmIzM5OywgZGVwcyk8
YnI+QEAgLTI4Myw2ICszMDIsMzYgQEAgcHl0aG9uIHJvb3Rmc19wcm9jZXNzX2lnbm9yZSgpIHs8
YnI+wqB9PGJyPsKgZG9fcm9vdGZzW3ByZWZ1bmNzXSArPSAmcXVvdDtyb290ZnNfcHJvY2Vzc19p
Z25vcmUmcXVvdDs8YnI+wqA8YnI+K3B5dGhvbiByb290ZnNfcHJvY2Vzc19wcmVmZXIoKSB7PGJy
PivCoMKgwqAgcGFja2FnZWluZm9saXN0ID0gcGFja2FnZWluZm8oZCk8YnI+Kzxicj4rwqDCoMKg
IGluc3RfcGtncyA9IGQuZ2V0VmFyKCZxdW90O1BBQ0tBR0VfSU5TVEFMTCZxdW90OywgVHJ1ZSku
c3BsaXQoKTxicj4rwqDCoMKgIHByZWZfcGtncyA9IGxpc3QoKTxicj4rwqDCoMKgIGZvciBwa2cg
aW4gaW5zdF9wa2dzOjxicj4rwqDCoMKgwqDCoMKgwqAgcHJlZmVyX3ZhciA9IGQuZ2V0VmFyKCZx
dW90O1BSRUZFUlJFRF9QUk9WSURFUl8lcyZxdW90OyAlIHBrZywgVHJ1ZSk8YnI+K8KgwqDCoMKg
wqDCoMKgIGlmIHByZWZlcl92YXI6PGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJiLm5vdGUo
JnF1b3Q7JXMgcnByb3ZpZGVkIGJ5IHJlY2lwZSAlcyZxdW90OyAlIChwa2csIHByZWZlcl92YXIp
KTxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIEZpbmQgcHJlZmVycmVkIHBhY2thZ2Ugd2hp
Y2ggcHJvdmlkZXMgaXRlbTxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgcCBpbiBwYWNr
YWdlaW5mb2xpc3Q6PGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBGaXJzdCBM
b29rIGZvciBQTiBhbmQgUlBST1ZJREVTXyR7UE59PGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgcFsmIzM5O1BOJiMzOTtdID09IHByZWZlcl92YXI6PGJyPivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YXIgPSAmIzM5O1JQUk9WSURFU18lcyYjMzk7
ICUgcFsmIzM5O1BLRyYjMzk7XTxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdHJ5Ojxicj4rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2YWwgPSBwW3Zhcl08YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGV4Y2VwdCBLZXlFcnJvcjo8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29udGludWU8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJwcm92aWRlc19zcGxpdCA9IHZhbC5zcGxpdCgmIzM5OyAmIzM5Oyk8YnI+K8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIHBrZyBpbiBycHJvdmlkZXNf
c3BsaXQ6PGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJiLm5vdGUoJiMzOTslcyBpbiAlcy4gV2lsbCBzdWJzdGl0dXRlIGluIFBBQ0tBR0VfSU5TVEFM
TCYjMzk7ICUgKHBrZywgdmFyKSk8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaW5zdF9wa2dzLnJlbW92ZShwa2cpPGJyPivCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByZWZfcGtncy5hcHBlbmQocFsmIzM5O1BL
RyYjMzk7XSk8YnI+K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5zdF9wa2dzLmV4dGVuZChwcmVm
X3BrZ3MpPGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciBwIGluIGluc3RfcGtnczo8YnI+
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiYi5ub3RlKCZxdW90OyVzICZxdW90OyAl
IHApPGJyPivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGQuc2V0VmFyKCZxdW90O1BBQ0tBR0VfSU5T
VEFMTCZxdW90OywgJiMzOTsgJiMzOTsuam9pbihpbnN0X3BrZ3MpKTxicj4rfTxicj4rZG9fcm9v
dGZzW3ByZWZ1bmNzXSArPSAmcXVvdDtyb290ZnNfcHJvY2Vzc19wcmVmZXImcXVvdDs8YnI+Kzxi
cj7CoCMgV2UgaGF2ZSB0byBkZWxheSB0aGUgcnVudGltZV9tYXBwaW5nX3JlbmFtZSB1bnRpbCBq
dXN0IGJlZm9yZSByb290ZnMgcnVuczxicj7CoCMgb3RoZXJ3aXNlLCB0aGUgbXVsdGlsaWIgcmVu
YW1pbmcgY291bGQgc3RlcCBpbiBhbmQgc3F1YXNoIGFueSBmaXh1cHMgdGhhdDxicj7CoCMgbWF5
IGhhdmUgb2NjdXJyZWQuPGJyPjxicj48L2Rpdj4NCg==

--089e0149bc1ad58f10051b919f9c--

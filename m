Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13C9EF0712
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 06:12:24 +0000 (UTC)
Subject: [RFC] Improving ext* sparse image generation: migrating from img2simg to ext4sparse for ext* filesystem
To: openembedded-core@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: IN (203.197.190.100)
X-Originating-Platform: Linux Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 08 Feb 2026 22:12:18 -0800
Message-ID: <Tn1R.1770617538678222907.ff9l@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="8wPSh2tsXnnFVOE9jrHk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 06:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230708

--8wPSh2tsXnnFVOE9jrHk
Content-Type: multipart/alternative; boundary="4Wyrve8ednm74qQtzDG4"

--4Wyrve8ednm74qQtzDG4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Community Members=C2=A0 ,

I would like to propose a change to how we handle sparse image generation f=
or ext* file-systems in OpenEmbedded,
specifically moving away from the generic img2simg tool toward the speciali=
sed ext2simg in the e2fsprogs [contrib/android]

*1) Problem*
Currently, image_types_sparse.bbclass uses img2simg for all file-system typ=
es.
img2simg is a=C2=A0 tool that reads the raw image to find zero-filled block=
s.
For ext* file-systems, this is inefficient compared to=C2=A0 ext2simg from =
e2fsprogs [contrib/android]
which understands the file-system structure and uses the block bitmap to de=
termine sparse areas.

*2) History*
Previously, 'ext2simg' was bundled within android-tools (v5.1 and older).
The utility has since migrated to the e2fsprogs project (contrib/android).
However, upstream e2fsprogs does not provide a build system for this tool,
and it requires libsparse from android-tools to compile.

*3) Proposed Changes*
To implement this, I am looking at a cross-layer approach:

a. meta-oe (android-tools):
Export libsparse, libbase, and liblog headers and libraries to the sysroot.=
 Currently, these are often internal to the build.
Reorganise header installation to ${includedir}/sparse to match the expecte=
d include paths for e2fsprogs contrib tools.

b. oe-core (e2fsprogs):
Add a conditional compilation step in e2fsprogs-native to build the ext4spa=
rse utility located in contrib/android/.
This would link against the exported libsparse from android-tools-native.

c. meta-oe (image_types_sparse.bbclass):
Update CONVERSION_CMD:sparse to detect ext* types.
Use=C2=A0 ext2simg from the e2fsprogs [contrib/android] for these types whi=
le falling back to img2simg for others (like f2fs).

*4) Points for Discussion / Feasibility*
I am seeking feedback on the following:

*a. Layer Dependency:*
This introduces a tighter coupling between oe-core and meta-oe.
Is it acceptable for e2fsprogs-native (core) to optionally depend on androi=
d-tools-native (meta-oe),
or i can create an bbapend file in meta-oe called e2fsprogs_%.bbappend.

*b. Build Integration:*
In my PoC, I've used a manual ${CC} call in do_compile:append.
Would it be preferred to patch the e2fsprogs Makefile to handle this "contr=
ib" tool more natively?

*c. Library Handling:*
To ensure the native binary finds libsparse at image creation time, I am cu=
rrently using LD_LIBRARY_PATH in the class.
I suspect a better approach would be ensuring proper RPATH during the e2fsp=
rogs build.
If members can help for any better way of doing this

*d. I have a working proof of concept using RPI4 build*
Attached alon are the patches
0001-e2fsprogs-creates-ext4sparse-using-android-tools-lib.patch
0001-meta-oe-image_types_sparse-use-ext4sparse-for-ext-im.patch

*5) Logical layout of current POC*
This commit bridges the gap between these two recipes:
1. android-tools:
- Updated to v29.0.6 and masked v5.1.1 to provide modern libraries.
- Modified do_install to export libsparse, libbase, and liblog
headers and libraries to the sysroot, enabling external linking.

2. image_types_sparse.bbclass:
- Updated CONVERSION_CMD to branch by filesystem type, calling
ext4sparse specifically for ext* images.
- Exported LD_LIBRARY_PATH to the native sysroot to ensure the
ext4sparse binary can locate its shared dependencies at runtime.

3. Layer Configuration:
- Updated layer.conf to support dynamic-layers for SELinux and
synchronized BBMASK entries to prioritize the updated tools.

*6) Benefit :*
This reduces the time and cost involved while flashing Android RFS / Fastbo=
ot etc
Even in CI/CD , which all adds to ease of usage and have monetary benefit i=
nvolved with continous CI/CD

Looking forward to thoughts / feedback from community members

Please do let me know if any specific platform or group needs to be address=
ed to have such discussion
If there is any specific meeting involved where i can join and explain , pl=
ease do let me know
I can connect to team members and works as per suggestion from community to=
 fine tune / rework if any specific changes community suggest

Thanks ,
Ashish Kumar Mishra

--4Wyrve8ednm74qQtzDG4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Community Members&nbsp; ,&nbsp;</div>
<div>&nbsp;</div>
<div>I would like to propose a change to how we handle sparse image generat=
ion for ext* file-systems in OpenEmbedded,&nbsp;</div>
<div>specifically moving away from the generic img2simg tool toward the spe=
cialised ext2simg in the e2fsprogs [contrib/android]</div>
<div>&nbsp;</div>
<div><strong>1) Problem</strong></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Currently, image_types_sparse.bbclass uses img2simg for all file-s=
ystem types.&nbsp;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>img2simg is a&nbsp; tool that reads the raw image to find zero-fil=
led blocks.&nbsp;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>For ext* file-systems, this is inefficient compared to&nbsp; ext2s=
img from e2fsprogs [contrib/android]</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>which understands the file-system structure and uses the block bit=
map to determine sparse areas.</span></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>2) History</strong></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Previously, 'ext2simg' was bundled within android-tools (v5.1 and =
older).</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>The utility has since migrated to the e2fsprogs project (contrib/a=
ndroid).</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>However, upstream e2fsprogs does not provide a build system for th=
is tool,</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>and it requires libsparse from android-tools to compile.</span></d=
iv>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>3) Proposed Changes</strong></div>
<div>To implement this, I am looking at a cross-layer approach:</div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>a. meta-oe (android-tools):</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Export libsparse, libbase, and liblog headers and libraries to the=
 sysroot. Currently, these are often internal to the build.</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Reorganise header installation to ${includedir}/sparse to match th=
e expected include paths for e2fsprogs contrib tools.</span></div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>b. oe-core (e2fsprogs):</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Add a conditional compilation step in e2fsprogs-native to build th=
e ext4sparse utility located in contrib/android/.</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>This would link against the exported libsparse from android-tools-=
native.</span></div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>c. meta-oe (image_types_sparse.bbclass):</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Update CONVERSION_CMD:sparse to detect ext* types.</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Use&nbsp; ext2simg from the e2fsprogs [contrib/android] for these =
types while falling back to img2simg for others (like f2fs).</span></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>4) Points for Discussion / Feasibility</strong></div>
<div>&nbsp; &nbsp; &nbsp;I am seeking feedback on the following:</div>
<div>&nbsp;</div>
<div><strong><span style=3D"white-space: normal;"><span style=3D"white-spac=
e: pre;"> </span>a. Layer Dependency:&nbsp;</span></strong></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>This introduces a tighter coupling between oe-core and meta-oe.&nb=
sp;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Is it acceptable for e2fsprogs-native (core) to optionally depend =
on android-tools-native (meta-oe),&nbsp;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>or i can create an bbapend file in meta-oe called e2fsprogs_%.bbap=
pend.&nbsp;</span></div>
<div>&nbsp;</div>
<div><strong><span style=3D"white-space: normal;"><span style=3D"white-spac=
e: pre;"> </span>b. Build Integration:&nbsp;</span></strong></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span> In my PoC, I've used a manual ${CC} call in do_compile:append.&nb=
sp;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span> Would it be preferred to patch the e2fsprogs Makefile to handle t=
his "contrib" tool more natively?</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp;</span></div>
<div><strong><span style=3D"white-space: normal;"><span style=3D"white-spac=
e: pre;"> </span>c. Library Handling:&nbsp;</span></strong></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; To ensure the native binary finds libsparse at image creati=
on time, I am currently using LD_LIBRARY_PATH in the class.&nbsp;</span></d=
iv>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; I suspect a better approach would be ensuring proper RPATH =
during the e2fsprogs build.</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; If members can help for any better way of doing this&nbsp;<=
/span></div>
<div>&nbsp;</div>
<div><strong><span style=3D"white-space: normal;"><span style=3D"white-spac=
e: pre;"> </span>d. I have a working proof of concept using RPI4 build&nbsp=
;</span></strong></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp;Attached alon are the patches&nbsp;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp; &nbsp;0001-e2fsprogs-creates-ext4sparse-using-androi=
d-tools-lib.patch&nbsp;&nbsp;</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp; &nbsp;0001-meta-oe-image_types_sparse-use-ext4sparse=
-for-ext-im.patch</span></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>5) Logical layout of current POC&nbsp;</strong></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>This commit bridges the gap between these two recipes:</span></div=
>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>1. android-tools:</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp;- Updated to v29.0.6 and masked v5.1.1 to provide mod=
ern libraries.</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp;- Modified do_install to export libsparse, libbase, a=
nd liblog</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span> headers and libraries to the sysroot, enabling external linking.<=
/span></div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>2. image_types_sparse.bbclass:</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp;- Updated CONVERSION_CMD to branch by filesystem type=
, calling</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span> ext4sparse specifically for ext* images.</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp;- Exported LD_LIBRARY_PATH to the native sysroot to e=
nsure the</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span> ext4sparse binary can locate its shared dependencies at runtime.<=
/span></div>
<div>&nbsp;</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>3. Layer Configuration:</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&nbsp; &nbsp;- Updated layer.conf to support dynamic-layers for SE=
Linux and</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span> synchronized BBMASK entries to prioritize the updated tools.</spa=
n></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><strong>6) Benefit :</strong></div>
<div>&nbsp; &nbsp; This reduces the time and cost involved while flashing A=
ndroid RFS / Fastboot etc&nbsp;</div>
<div>&nbsp; &nbsp; Even in CI/CD , which all adds to ease of usage and have=
 monetary benefit involved with continous CI/CD&nbsp;</div>
<div>&nbsp;</div>
<div>Looking forward to thoughts / feedback from community members</div>
<div>&nbsp;</div>
<div>Please do let me know if any specific platform or group needs to be ad=
dressed to have such discussion&nbsp;</div>
<div>If there is any specific meeting involved where i can join and explain=
 , please do let me know&nbsp;<br />I can connect to team members and works=
 as per suggestion from community to fine tune / rework if any specific cha=
nges community suggest&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks ,&nbsp;</div>
<div>Ashish Kumar Mishra&nbsp;<br /><br /></div>

--4Wyrve8ednm74qQtzDG4--

--8wPSh2tsXnnFVOE9jrHk
Content-Type: text/x-patch; name="0001-meta-oe-image_types_sparse-use-ext4sparse-for-ext-im.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-meta-oe-image_types_sparse-use-ext4sparse-for-ext-im.patch"

RnJvbSA1MzM2NDhiMTIwODEzMWQ0YWRhYjE1YzQ4ZTVjN2ViNWMwNzcyZDczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBc2hpc2hLdW1hciBNaXNocmEgPGFzaGlzaGt1bWFyLm1pc2hy
YUBibXd0ZWNod29ya3MuaW4+CkRhdGU6IE1vbiwgOSBGZWIgMjAyNiAxMToxMTowOCArMDUzMApT
dWJqZWN0OiBbUEFUQ0hdIG1ldGEtb2U6IGltYWdlX3R5cGVzX3NwYXJzZTogdXNlIGV4dDRzcGFy
c2UgZm9yIGV4dCogaW1hZ2UKIGNvbnZlcnNpb24KClVwZGF0ZSB0aGUgc3BhcnNlIGltYWdlIGNv
bnZlcnNpb24gcHJvY2VzcyBmb3IgZXh0KiBmaWxlc3lzdGVtcyB0byB1c2UKZXh0NHNwYXJzZSAo
ZXh0MnNpbWcpIGluc3RlYWQgb2YgdGhlIGdlbmVyaWMgaW1nMnNpbWcgdG9vbC4KClVubGlrZSBp
bWcyc2ltZywgd2hpY2ggdHJlYXRzIGFsbCB6ZXJvLWJsb2NrcyBpZGVudGljYWxseSwgZXh0NHNw
YXJzZSBsZXZlcmFnZXMKZTJmc3Byb2dzIGtub3dsZWRnZSBvZiB0aGUgZmlsZXN5c3RlbS4KVGhp
cyBhbGxvd3MgaXQgdG8gbWFyayB6ZXJvLWJsb2NrcyBvdXRzaWRlIG9mIHRoZSBleHQtZmlsZXN5
c3RlbSBhcwoiZG9uJ3QgY2FyZSIgKHNraXAgY2h1bmtzKSByYXRoZXIgdGhhbiAiZmlsbC13aXRo
LXplcm9zIiAocmF3IGNodW5rcykKcmVzdWx0aW5nIGluIG1vcmUgb3B0aW1pemVkIGFuZCBzbWFs
bGVyIHNwYXJzZSBpbWFnZXMuCgpQcmV2aW91c2x5LCAnZXh0MnNpbWcnIHdhcyBidW5kbGVkIHdp
dGhpbiBhbmRyb2lkLXRvb2xzICh2NS4xIGFuZCBvbGRlcikuClRoZSB1dGlsaXR5IGhhcyBzaW5j
ZSBtaWdyYXRlZCB0byB0aGUgZTJmc3Byb2dzIHByb2plY3QgKGNvbnRyaWIvYW5kcm9pZCkuCkhv
d2V2ZXIsIHVwc3RyZWFtIGUyZnNwcm9ncyBkb2VzIG5vdCBwcm92aWRlIGEgYnVpbGQgc3lzdGVt
IGZvciB0aGlzIHRvb2wsCmFuZCBpdCByZXF1aXJlcyBsaWJzcGFyc2UgZnJvbSBhbmRyb2lkLXRv
b2xzIHRvIGNvbXBpbGUuCgpUaGlzIGNvbW1pdCBicmlkZ2VzIHRoZSBnYXAgYmV0d2VlbiB0aGVz
ZSB0d28gcmVjaXBlczoKMS4gYW5kcm9pZC10b29sczoKICAgLSBVcGRhdGVkIHRvIHYyOS4wLjYg
YW5kIG1hc2tlZCB2NS4xLjEgdG8gcHJvdmlkZSBtb2Rlcm4gbGlicmFyaWVzLgogICAtIE1vZGlm
aWVkIGRvX2luc3RhbGwgdG8gZXhwb3J0IGxpYnNwYXJzZSwgbGliYmFzZSwgYW5kIGxpYmxvZwog
ICAgIGhlYWRlcnMgYW5kIGxpYnJhcmllcyB0byB0aGUgc3lzcm9vdCwgZW5hYmxpbmcgZXh0ZXJu
YWwgbGlua2luZy4KCjIuIGltYWdlX3R5cGVzX3NwYXJzZS5iYmNsYXNzOgogICAtIFVwZGF0ZWQg
Q09OVkVSU0lPTl9DTUQgdG8gYnJhbmNoIGJ5IGZpbGVzeXN0ZW0gdHlwZSwgY2FsbGluZwogICAg
IGV4dDRzcGFyc2Ugc3BlY2lmaWNhbGx5IGZvciBleHQqIGltYWdlcy4KICAgLSBFeHBvcnRlZCBM
RF9MSUJSQVJZX1BBVEggdG8gdGhlIG5hdGl2ZSBzeXNyb290IHRvIGVuc3VyZSB0aGUKICAgICBl
eHQ0c3BhcnNlIGJpbmFyeSBjYW4gbG9jYXRlIGl0cyBzaGFyZWQgZGVwZW5kZW5jaWVzIGF0IHJ1
bnRpbWUuCgozLiBMYXllciBDb25maWd1cmF0aW9uOgogICAtIFVwZGF0ZWQgbGF5ZXIuY29uZiB0
byBzdXBwb3J0IGR5bmFtaWMtbGF5ZXJzIGZvciBTRUxpbnV4IGFuZAogICAgIHN5bmNocm9uaXpl
ZCBCQk1BU0sgZW50cmllcyB0byBwcmlvcml0aXplIHRoZSB1cGRhdGVkIHRvb2xzLgoKVXBzdHJl
YW0tU3RhdHVzOiBQZW5kaW5nCgpTaWduZWQtb2ZmLWJ5OiBBc2hpc2hLdW1hciBNaXNocmEgPGFz
aGlzaGt1bWFyLm1pc2hyYUBibXd0ZWNod29ya3MuaW4+Ci0tLQogbWV0YS1vZS9jbGFzc2VzL2lt
YWdlX3R5cGVzX3NwYXJzZS5iYmNsYXNzICAgIHwgMjYgKysrKysrKy0tLQogbWV0YS1vZS9jb25m
L2xheWVyLmNvbmYgICAgICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKy0KIC4uLi9hbmRyb2lk
LXRvb2xzL2FuZHJvaWQtdG9vbHNfMjkuMC42LnIxNC5iYiB8IDUxICsrKysrKysrKysrKysrKysr
KysKIDMgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tZXRhLW9lL2NsYXNzZXMvaW1hZ2VfdHlwZXNfc3BhcnNlLmJiY2xhc3MgYi9t
ZXRhLW9lL2NsYXNzZXMvaW1hZ2VfdHlwZXNfc3BhcnNlLmJiY2xhc3MKaW5kZXggNTQxNmMyYTAx
OS4uMDNlMGVjZDZjMyAxMDA2NDQKLS0tIGEvbWV0YS1vZS9jbGFzc2VzL2ltYWdlX3R5cGVzX3Nw
YXJzZS5iYmNsYXNzCisrKyBiL21ldGEtb2UvY2xhc3Nlcy9pbWFnZV90eXBlc19zcGFyc2UuYmJj
bGFzcwpAQCAtMTIsMTIgKzEyLDIyIEBAIENPTlZFUlNJT05UWVBFUyArPSAic3BhcnNlIgogREVM
RVRFX1JBV0lNQUdFX0FGVEVSX1NQQVJTRV9DTUQgPz89ICIwIgogCiBDT05WRVJTSU9OX0NNRDpz
cGFyc2UgPSAiIFwKLSAgICB0cnVuY2F0ZSAtLW5vLWNyZWF0ZSAtLXNpemU9JSR7U1BBUlNFX0JM
T0NLX1NJWkV9ICIke0lNQUdFX05BTUV9LiR7dHlwZX0iOyBcCi0gICAgaW1nMnNpbWcgLXMgIiR7
SU1BR0VfTkFNRX0uJHt0eXBlfSIgIiR7SU1BR0VfTkFNRX0uJHt0eXBlfS5zcGFyc2UiICR7U1BB
UlNFX0JMT0NLX1NJWkV9OyBcCi0gICAgaWYgWyAiJHtERUxFVEVfUkFXSU1BR0VfQUZURVJfU1BB
UlNFX0NNRH0iID0gIjEiIF07IHRoZW4gXAotICAgICAgICBybSAtZiAke0lNQUdFX05BTUV9LiR7
dHlwZX07XAotICAgICAgICBiYndhcm4gIlJhdyBmaWxlICR7SU1BR0VfTkFNRX0uJHt0eXBlfSBy
ZW1vdmVkIiA7XAotICAgIGZpO1wKLSAiCisgICAgdHJ1bmNhdGUgLS1uby1jcmVhdGUgLS1zaXpl
PSUke1NQQVJTRV9CTE9DS19TSVpFfSAnJHtJTUFHRV9OQU1FfS4ke3R5cGV9JzsgXAorICAgIGNh
c2UgJyR7dHlwZX0nIGluIFwKKyAgICAgICAgZXh0KikgXAorICAgICAgICAgICAgZXhwb3J0IExE
X0xJQlJBUllfUEFUSD0nJHtTVEFHSU5HX0xJQkRJUl9OQVRJVkV9OiR7TERfTElCUkFSWV9QQVRI
fSc7IFwKKyAgICAgICAgICAgIFwKKyAgICAgICAgICAgIGJid2FybiAnUnVubmluZyBlMmZzcHJv
Z3MtZGVyaXZlZCBleHQ0c3BhcnNlLi4uJyA7IFwKKyAgICAgICAgICAgIGV4dDRzcGFyc2UgJyR7
SU1BR0VfTkFNRX0uJHt0eXBlfScgJyR7SU1BR0VfTkFNRX0uc2ltZycgfHwgYmJlcnJvciAnZXh0
NHNwYXJzZSBmYWlsZWQnIFwKKyAgICAgICAgICAgIDs7IFwKKyAgICAgICAgKikgXAorICAgICAg
ICAgICAgYmJ3YXJuICdHZW5lcmF0aW5nIHNwYXJzZSBpbWFnZSBmb3Igbm9uLWV4dCBmaWxlc3lz
dGVtLi4uJzsgXAorICAgICAgICAgICAgaW1nMnNpbWcgLXMgJyR7SU1BR0VfTkFNRX0uJHt0eXBl
fScgJyR7SU1BR0VfTkFNRX0uJHt0eXBlfS5zcGFyc2UnICR7U1BBUlNFX0JMT0NLX1NJWkV9OyBc
CisgICAgICAgICAgICA7OyBcCisgICAgZXNhYzsgXAorICAgIGlmIFsgJyR7REVMRVRFX1JBV0lN
QUdFX0FGVEVSX1NQQVJTRV9DTUR9JyA9ICcxJyBdOyB0aGVuIFwKKyAgICAgICAgcm0gLWYgJyR7
SU1BR0VfTkFNRX0uJHt0eXBlfSc7IFwKKyAgICBmaTsgXAorIgogCi1DT05WRVJTSU9OX0RFUEVO
RFNfc3BhcnNlID0gImFuZHJvaWQtdG9vbHMtbmF0aXZlIgorQ09OVkVSU0lPTl9ERVBFTkRTOnNw
YXJzZSA9ICJhbmRyb2lkLXRvb2xzLW5hdGl2ZSBlMmZzcHJvZ3MtbmF0aXZlIgpkaWZmIC0tZ2l0
IGEvbWV0YS1vZS9jb25mL2xheWVyLmNvbmYgYi9tZXRhLW9lL2NvbmYvbGF5ZXIuY29uZgppbmRl
eCAxODZmZjlhNDg4Li45Y2UyY2RiNjZjIDEwMDY0NAotLS0gYS9tZXRhLW9lL2NvbmYvbGF5ZXIu
Y29uZgorKysgYi9tZXRhLW9lL2NvbmYvbGF5ZXIuY29uZgpAQCAtMTIsNyArMTIsMTYgQEAKIEJC
UEFUSCAuPSAiOiR7TEFZRVJESVJ9IgogCiAjIFdlIGhhdmUgYSByZWNpcGVzIGRpcmVjdG9yeSwg
YWRkIHRvIEJCRklMRVMKLUJCRklMRVMgKz0gIiR7TEFZRVJESVJ9L3JlY2lwZXMtKi8qLyouYmIg
JHtMQVlFUkRJUn0vcmVjaXBlcy0qLyovKi5iYmFwcGVuZCIKKyMgQWRkaW5nIGR5bmFtaWMgbGF5
ZXJzIHJlY2lwZXMKK0JCRklMRVMgKz0gIlwKKyAgICAke0xBWUVSRElSfS9yZWNpcGVzLSovKi8q
LmJiIFwKKyAgICAke0xBWUVSRElSfS9yZWNpcGVzLSovKi8qLmJiYXBwZW5kIFwKKyAgICAke0xB
WUVSRElSfS9keW5hbWljLWxheWVycy9zZWxpbnV4L3JlY2lwZXMtKi8qLyouYmIgXAorICAgICR7
TEFZRVJESVJ9L2R5bmFtaWMtbGF5ZXJzL3NlbGludXgvcmVjaXBlcy0qLyovKi5iYmFwcGVuZCBc
CisiCisKKyMgTWFudWFsbHkgcmVtb3ZpbmcgZGVmYXVsdCBhbmRyb2lkLXRvb2xzIHJlY2lwZXMK
K0JCTUFTSyArPSAibWV0YS1vcGVuZW1iZWRkZWQvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Fu
ZHJvaWQtdG9vbHMvYW5kcm9pZC10b29sc181LjEuMS5yMzcuYmIiCiAKIEJCRklMRV9DT0xMRUNU
SU9OUyArPSAib3BlbmVtYmVkZGVkLWxheWVyIgogQkJGSUxFX1BBVFRFUk5fb3BlbmVtYmVkZGVk
LWxheWVyIDo9ICJeJHtMQVlFUkRJUn0vIgpAQCAtNDAsNiArNDksOCBAQCBCQkZJTEVTX0RZTkFN
SUMgKz0gIiBcCiAgICAgcGVybC1sYXllcjoke0xBWUVSRElSfS9keW5hbWljLWxheWVycy9wZXJs
LWxheWVyL3JlY2lwZXMtKi8qLyouYmJhcHBlbmQgXAogICAgIHNlbGludXg6JHtMQVlFUkRJUn0v
ZHluYW1pYy1sYXllcnMvc2VsaW51eC9yZWNpcGVzLSovKi8qLmJiIFwKICAgICBzZWxpbnV4OiR7
TEFZRVJESVJ9L2R5bmFtaWMtbGF5ZXJzL3NlbGludXgvcmVjaXBlcy0qLyovKi5iYmFwcGVuZCBc
CisgICAgc2VsaW51eC1sYXllcjoke0xBWUVSRElSfS9keW5hbWljLWxheWVycy9zZWxpbnV4L3Jl
Y2lwZXMtKi8qLyouYmIgXAorICAgIHNlbGludXgtbGF5ZXI6JHtMQVlFUkRJUn0vZHluYW1pYy1s
YXllcnMvc2VsaW51eC9yZWNpcGVzLSovKi8qLmJiYXBwZW5kIFwKICIKIAogIyBUaGlzIHNob3Vs
ZCBvbmx5IGJlIGluY3JlbWVudGVkIG9uIHNpZ25pZmljYW50IGNoYW5nZXMgdGhhdCB3aWxsCmRp
ZmYgLS1naXQgYS9tZXRhLW9lL2R5bmFtaWMtbGF5ZXJzL3NlbGludXgvcmVjaXBlcy1kZXZ0b29s
L2FuZHJvaWQtdG9vbHMvYW5kcm9pZC10b29sc18yOS4wLjYucjE0LmJiIGIvbWV0YS1vZS9keW5h
bWljLWxheWVycy9zZWxpbnV4L3JlY2lwZXMtZGV2dG9vbC9hbmRyb2lkLXRvb2xzL2FuZHJvaWQt
dG9vbHNfMjkuMC42LnIxNC5iYgppbmRleCA3NDkyOGVkMTcxLi4wYTg1MThhMWRkIDEwMDY0NAot
LS0gYS9tZXRhLW9lL2R5bmFtaWMtbGF5ZXJzL3NlbGludXgvcmVjaXBlcy1kZXZ0b29sL2FuZHJv
aWQtdG9vbHMvYW5kcm9pZC10b29sc18yOS4wLjYucjE0LmJiCisrKyBiL21ldGEtb2UvZHluYW1p
Yy1sYXllcnMvc2VsaW51eC9yZWNpcGVzLWRldnRvb2wvYW5kcm9pZC10b29scy9hbmRyb2lkLXRv
b2xzXzI5LjAuNi5yMTQuYmIKQEAgLTE5MCwzICsxOTAsNTQgQEAgRklMRVM6JHtQTn0tZnN0b29s
cyA9ICJcCiBGSUxFUzoke1BOfSArPSAiJHtsaWJkaXJ9L2FuZHJvaWQgJHtsaWJkaXJ9L2FuZHJv
aWQvKiIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiCisKK2FuZHJvaWRfdG9vbHNfZW5hYmxl
X2Rldm1vZGUoKSB7CisgICAgdG91Y2ggJHtJTUFHRV9ST09URlN9L2V0Yy91c2ItZGVidWdnaW5n
LWVuYWJsZWQKK30KKworUk9PVEZTX1BPU1RQUk9DRVNTX0NPTU1BTkRfJHtQTn0tYWRiZCArPSAi
JHtAYmIudXRpbHMuY29udGFpbnMoIlVTQl9ERUJVR0dJTkdfRU5BQkxFRCIsICIxIiwgImFuZHJv
aWRfdG9vbHNfZW5hYmxlX2Rldm1vZGU7IiwgIiIsIGQpfSIKKworIyBlMmZzcHJvZ3MgZXhwZWN0
aW5nIGhlYWRlcnMgaW4gc3BhcnNlLyBzdWJkaXJlY3RvcnkKK2RvX2luc3RhbGw6YXBwZW5kKCkg
eworICAgICMgdG8gcmVzb2x2ZSB0aGUgIk11bHRpcGxlIHNobGliIHByb3ZpZGVycyIgY29uZmxp
Y3QuCisgICAgcm0gLWYgJHtEfSR7bGliZGlyfS9hbmRyb2lkL2xpYnNwYXJzZS5zbyoKKyAgICBy
bSAtZiAke0R9JHtsaWJkaXJ9L2FuZHJvaWQvbGliYmFzZS5zbyoKKyAgICBybSAtZiAke0R9JHts
aWJkaXJ9L2FuZHJvaWQvbGlibG9nLnNvKgorCisgICAgaWYgWyAtZCAiJHtTfS9zeXN0ZW0vY29y
ZS9saWJzcGFyc2UvaW5jbHVkZS9zcGFyc2UiIF07IHRoZW4KKyAgICAgICAgaW5zdGFsbCAtZCAk
e0R9JHtpbmNsdWRlZGlyfS9zcGFyc2UKKyAgICAgICAgY3AgLXIgJHtTfS9zeXN0ZW0vY29yZS9s
aWJzcGFyc2UvaW5jbHVkZS9zcGFyc2UvKiAke0R9JHtpbmNsdWRlZGlyfS9zcGFyc2UvCisgICAg
ZWxzZQorICAgICAgICBiYmVycm9yICJTcGFyc2UgaGVhZGVycyBub3QgZm91bmQgaW4gJHtTfS9z
eXN0ZW0vY29yZS9saWJzcGFyc2UvaW5jbHVkZS9zcGFyc2UiCisgICAgZmkKKworICAgIGluc3Rh
bGwgLWQgJHtEfSR7bGliZGlyfQorICAgIGZvciBsaWIgaW4gbGlic3BhcnNlIGxpYmJhc2UgbGli
bG9nOyBkbworICAgICAgICBpZiBbIC1mICIke1N9L2RlYmlhbi9vdXQvc3lzdGVtL2NvcmUvJHts
aWJ9LnNvIiBdOyB0aGVuCisgICAgICAgICAgICBiYndhcm4gIkluc3RhbGxpbmcgJHtsaWJ9IHRv
IHN5c3Jvb3QiCisgICAgICAgICAgICBpbnN0YWxsIC1tIDA3NTUgJHtTfS9kZWJpYW4vb3V0L3N5
c3RlbS9jb3JlLyR7bGlifS5zbyAke0R9JHtsaWJkaXJ9LyR7bGlifS5zby4wCisgICAgICAgICAg
ICBsbiAtc2YgJHtsaWJ9LnNvLjAgJHtEfSR7bGliZGlyfS8ke2xpYn0uc28KKyAgICAgICAgZmkK
KyAgICBkb25lCisKKyAgICBpbnN0YWxsIC1kICR7RH0ke2xpYmRpcn0vYW5kcm9pZAorICAgIGZv
ciBsaWIgaW4gbGlic3BhcnNlIGxpYmJhc2UgbGlibG9nOyBkbworICAgICAgICBpZiBbIC1mICIk
e0R9JHtsaWJkaXJ9LyR7bGlifS5zby4wIiBdOyB0aGVuCisgICAgICAgICAgICBsbiAtc2YgLi4v
JHtsaWJ9LnNvLjAgJHtEfSR7bGliZGlyfS9hbmRyb2lkLyR7bGlifS5zby4wCisgICAgICAgICAg
ICBsbiAtc2YgLi4vJHtsaWJ9LnNvICR7RH0ke2xpYmRpcn0vYW5kcm9pZC8ke2xpYn0uc28KKyAg
ICAgICAgZmkKKyAgICBkb25lCit9CisKK0ZJTEVTOiR7UE59LWRldiArPSAiIFwKKyAgICAke2lu
Y2x1ZGVkaXJ9L3NwYXJzZSBcCisgICAgJHtsaWJkaXJ9L2xpYiouc28gXAorICAgICR7bGliZGly
fS9hbmRyb2lkL2xpYiouc28gXAorIgorCitGSUxFUzoke1BOfSArPSAiIFwKKyAgICAke2xpYmRp
cn0vbGliKi5zby4qIFwKKyAgICAke2xpYmRpcn0vYW5kcm9pZC9saWIqLnNvLiogXAorIgorCitT
WVNST09UX0RJUlM6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgJHtpbmNsdWRlZGlyfSAke2xpYmRp
cn0iCi0tIAoyLjM0LjEKCg==

--8wPSh2tsXnnFVOE9jrHk
Content-Type: text/x-patch; name="0001-e2fsprogs-creates-ext4sparse-using-android-tools-lib.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-e2fsprogs-creates-ext4sparse-using-android-tools-lib.patch"

RnJvbSBkNDNmMDc0N2E1N2E5NzY1NzhmMGJmYTI1OWZhZTExMDYzYjZiMTJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBc2hpc2hLdW1hciBNaXNocmEgPGFzaGlzaGt1bWFyLm1pc2hy
YUBibXd0ZWNod29ya3MuaW4+CkRhdGU6IE1vbiwgOSBGZWIgMjAyNiAxMToxNDozMyArMDUzMApT
dWJqZWN0OiBbUEFUQ0hdIGUyZnNwcm9nczogY3JlYXRlcyBleHQ0c3BhcnNlIHVzaW5nIGFuZHJv
aWQtdG9vbHMgbGlicmFyeQoKQWRkIGEgY3VzdG9tIGRvX2NvbXBpbGUgc3RlcCB0byBidWlsZCB0
aGUgZXh0NHNwYXJzZSB1dGlsaXR5IChleHQyc2ltZykKd2hlbiBidWlsZGluZyBmb3IgdGhlIG5h
dGl2ZSBjbGFzcyB1c2luZyBhbmRyb2lkLXRvb2xzLW5hdGl2ZS4KSW5jbHVkZXMgZGVidWcgbG9n
Z2luZyBmb3IgYnVpbGQgdmVyaWZpY2F0aW9uCgpVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKClNp
Z25lZC1vZmYtYnk6IEFzaGlzaEt1bWFyIE1pc2hyYSA8YXNoaXNoa3VtYXIubWlzaHJhQGJtd3Rl
Y2h3b3Jrcy5pbj4KLS0tCiAuLi4vZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjMuYmIgICAgICAg
ICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJm
c3Byb2dzXzEuNDcuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3By
b2dzXzEuNDcuMy5iYgppbmRleCA0MDY1ODM5OWQ5Li4wOTBkYmQxMjgyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjMuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny4zLmJiCkBAIC0x
NTEsMyArMTUxLDI2IEBAIGRvX2luc3RhbGxfcHRlc3QoKSB7CiAgICAgICAgIGluc3RhbGwgLWQg
JHtEfSR7UFRFU1RfUEFUSH0vZGF0YQogICAgICAgICBpbnN0YWxsIC1tIDA2NDQgJHtCfS90ZXN0
cy90ZXN0X2RhdGEudG1wICR7RH0ke1BURVNUX1BBVEh9L2RhdGEvCiB9CisKK0RFUEVORFM6YXBw
ZW5kOmNsYXNzLW5hdGl2ZSA9ICIgYW5kcm9pZC10b29scy1uYXRpdmUgIgorCitkb19jb21waWxl
OmFwcGVuZDpjbGFzcy1uYXRpdmUoKSB7CisgICAgYmJ3YXJuICI9PT09PT09PT09PT09PT0gREVC
VUcgPT09PT09PT09PT09PT09PT09PT09PT0iCisgICAgYmJ3YXJuICJDb21waWxpbmcgZXh0MnNp
bWcuYyB3aXRoIG5hdGl2ZSB0b29sY2hhaW4iCisgICAgIyBTb3VyY2UgZGlyZWN0b3J5IGZvciBl
eHQyc2ltZy5jIGluIHRoZSBlMmZzcHJvZ3MgdHJlZQorICAgIFNSQ19FWFQyU0lNRz0iJHtTfS9j
b250cmliL2FuZHJvaWQiCisKKyAgICBJTkNMVURFUz0iLUkke1N9L2xpYiAtSSR7Qn0vbGliIC1J
JHtTUkNfRVhUMlNJTUd9L2xpYiIKKworICAgICMgU1RBR0lOR19MSUJESVJfTkFUSVZFOiB3aGVy
ZSBhbmRyb2lkLXRvb2xzLW5hdGl2ZSBpbnN0YWxsZWQgbGlic3BhcnNlCisgICAgTElCUz0iLUwk
e0J9L2xpYiAtTCR7U1RBR0lOR19MSUJESVJfTkFUSVZFfSAtbHNwYXJzZSAtbGV4dDJmcyAtbHog
LWxjb21fZXJyIgorCisgICAgJHtDQ30gJHtDRkxBR1N9ICR7TERGTEFHU30gLW8gIiR7Qn0vZXh0
NHNwYXJzZSIgIiR7U1JDX0VYVDJTSU1HfS9leHQyc2ltZy5jIiAke0lOQ0xVREVTfSAke0xJQlN9
CisgICAgYmJ3YXJuICJleHQ0c3BhcnNlIGNvbXBpbGF0aW9uIGZpbmlzaGVkIgorICAgIGJid2Fy
biAiPT09PT09PT09PT09PT09IERFQlVHID09PT09PT09PT09PT09PT09PT09PT09IgorfQorCitk
b19pbnN0YWxsOmFwcGVuZDpjbGFzcy1uYXRpdmUoKSB7CisgICAgaW5zdGFsbCAtZCAke0R9JHti
aW5kaXJ9CisgICAgaW5zdGFsbCAtbSAwNzU1ICR7Qn0vZXh0NHNwYXJzZSAke0R9JHtiaW5kaXJ9
L2V4dDRzcGFyc2UKK30KLS0gCjIuMzQuMQoK

--8wPSh2tsXnnFVOE9jrHk--


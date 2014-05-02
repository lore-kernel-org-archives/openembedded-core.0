Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 10F2D60559
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 16:44:22 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id hy4so5739022vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 09:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=p7b6gOguMuVugmFNpn8DXa+J4wihLpgQp5NMdk4qfvE=;
	b=jpDmIVweeSCSBE23tjeGqDeZf0kv3BxZdVpHUK+XoqI1QL+kpVZrUsRDePLs5fDfvi
	+ZmsMF0CaLdFJg2AMLM8phsX5XuR+/pvWwSrEwdJukqSq4IGfDeZMCbeFeAEFy5cJ0Mh
	LPgaI1iNaIzKA9N0DsEUTLhWaUBvQtcf9zILiZ5M4r/zlO1DXT1ejy0JJVbYS8wdwXlj
	/8X+NDhG8ypcNkXNvtfesz3MKZjOp8IRWd+NcoM5AdDmQlixZbOhnWDF6LAMvEZP+K5K
	7/TAFbFse0AJJeiWe7GM4BL3HQKSJ+lpnknGjTIHQT0Atur/659mH5Ant3SNRLZSUKEB
	qybA==
X-Received: by 10.52.166.102 with SMTP id zf6mr11705176vdb.2.1399049063256;
	Fri, 02 May 2014 09:44:23 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Fri, 2 May 2014 09:43:43 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 2 May 2014 17:43:43 +0100
X-Google-Sender-Auth: vXmLGX_SKUuVD7tNpNFQqOjC9gk
Message-ID: <CANyK_8f74ZEqzX1ve=93GnZ7fg1NEiZUVeOKmmHuY+kHX-UseA@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Ensuring a task is re-ran when local.conf is updated
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
X-List-Received-Date: Fri, 02 May 2014 16:44:25 -0000
X-Groupsio-MsgNum: 52757
Content-Type: multipart/mixed; boundary=001a11c361dc706a8204f86d7ec5

--001a11c361dc706a8204f86d7ec5
Content-Type: text/plain; charset=UTF-8

Hi all, I'm wondering if someone can help me debug this problem a
little as it's getting into the parts of bitbake I don't know very
well, in particular the determination of whether a task needs to
re-run or not.

I've attached a patch which adds code to do_package_write_ipk in
package_ipk.bbclass to split up the package feed if
IPK_HIERARCHICAL_FEED is set to "1". The commit message in the patch
explains why I'm doing this and if it all works I'll submit this to
master. The attached patch isn't ready for submission yet, it needs
more testing first.

As expected, if IPK_HIERARCHICAL_FEED is not set in local.conf, the
package feed is created in the old way. If IPK_HIERARCHICAL_FEED is
set to "1" in local.conf, the package feed is created in my modified
way. This was tested by building from scratch in each case, with no
sstate or tmp directory present.

However if IPK_HIERARCHICAL_FEED is changed in local.conf, the package
feed is not recreated. I can force do_write_package_ipk and the new
value is taken into account, but if I just do my usual 'bitbake
kitchen-sink' where kitchen-sink is a packagegroup which depends on
everything I want in the package feed, do_write_package_ipk is not
re-ran for any recipe.

Am I missing something here? Is it expected that this variable change
is detected and the relevant tasks re-executed? I know changing
variables like PREFERRED_PROVIDER_* in local.conf causes things to be
rebuilt, so why does that work and this not?

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--001a11c361dc706a8204f86d7ec5
Content-Type: text/x-diff; charset=US-ASCII; 
	name="0001-package_ipk.bbclass-Support-hierarchical-feed.patch"
Content-Disposition: attachment; 
	filename="0001-package_ipk.bbclass-Support-hierarchical-feed.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hupoiijz0

RnJvbSA3NWU4MDAwOGIyZjZiYjcwMmJkNDljNDdlY2E2ZTYxYjZhMDQ3MzczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQYXVsIEJhcmtlciA8cGF1bEBwYXVsYmFya2VyLm1lLnVrPgpE
YXRlOiBGcmksIDIgTWF5IDIwMTQgMTQ6NTE6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBwYWNr
YWdlX2lway5iYmNsYXNzOiBTdXBwb3J0IGhpZXJhcmNoaWNhbCBmZWVkClRvOiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCgpUaGlzIHBhdGNoIGFsbG93cyBmb3IgYW4g
b3B0aW9uYWwgbmV3IGxheW91dCBmb3IgaXBrIGZlZWQgZGlyZWN0b3JpZXMgd2hpY2ggSSd2ZQpj
YWxsZWQgYSAnaGllcmFyY2hpY2FsIGZlZWQnIGFuZCBpcyBiYXNlZCBvbiBob3cgRGViaWFuIHBv
b2xzIHBhY2thZ2UgZmlsZXMuIEl0CmlzIGRpc2FibGVkIGJ5IGRlZmF1bHQgYW5kIGlzIGVuYWJs
ZWQgYnkgc2V0dGluZyBJUEtfSElFUkFSQ0hJQ0FMX0ZFRUQgdG8gIjEiLgoKSW4gdGhlIHRyYWRp
dGlvbmFsIGZlZWQgbGF5b3V0LCBwYWNrYWdlIGZpbGVzIGFyZSBwbGFjZWQgaW4gPG91dGRpcj4v
PGFyY2g+Ly4KVGhpcyBjYW4gbGVhZCB0byBzZXZlcmFsIHRob3VzYW5kIGZpbGVzIGV4aXN0aW5n
IGluIGEgc2luZ2xlIGRpcmVjdG9yeSB3aGljaCBpcwpvZnRlbiBhIHByb2JsZW0gaWYgZGV2ZWxv
cGVycyB3YW50IHRvIHVwbG9hZCBhIHBhY2thZ2UgZmVlZCB0byBhIHNoYXJlZCB3ZWIKaG9zdGlu
ZyBwcm92aWRlci4gRm9yIGV4YW1wbGUsIGluIG15IGNhc2UsIGxpc3RpbmcgZmlsZXMgdmlhIEZU
UCBvbmx5IHNob3dzIHRoZQpmaXJzdCAyMDAwIGZpbGVzLCBicmVha2luZyBteSBzY3JpcHRzIHdo
aWNoIGF0dGVtcHQgdG8gdXBsb2FkIG9ubHkgbmV3IGFuZApjaGFuZ2VkIGZpbGVzIHZpYSBGVFAu
CgpJbiB0aGUgaGllcmFyY2hpY2FsIGZlZWQsIHBhY2thZ2UgZmlsZXMgYXJlIHdyaXR0ZW4gdG8K
PG91dGRpcj4vPGFyY2g+Lzxwa2dfcHJlZml4Pi88cGtnX3N1YmRpcj4sIHdoZXJlIHBrZ19wcmVm
aXggaXMgdGhlIGZpcnN0IGxldHRlcgpvZiB0aGUgcGFja2FnZSBmaWxlIG5hbWUgZm9yIG5vbi1s
aWIgcGFja2FnZXMgb3IgImxpYiIgcGx1cyB0aGUgNHRoIGxldHRlciBvZgp0aGUgcGFjYWtnZSBm
aWxlIG5hbWUgZm9yIGxpYiBwYWNha2dlcyAoZWcsICdsJyBmb3IgbGVzcywgJ2xpYmMnIGZvciBs
aWJjNikuCnBrZ19zdWJkaXIgaXMgdGhlIHJvb3Qgb2YgdGhlIHBhY2FrZ2UgZmlsZSBuYW1lLCBk
aXNjYXJkaW5nIHRoZSB2ZXJzaW9uIGFuZAphcmNoaXRlY3R1cmUgcGFydHMgYW5kIHRoZSBjb21t
b24gc3VmZml4ZXMgJy1kYmcnLCAnLWRldicsICctZG9jJywgJy1zdGF0aWNkZXYnCmFuZCAnLWxv
Y2FsZS0qJy4KClRoaXMgY2hhbmdlIHJlbGllcyBvbiByZWNlbnQgcGF0Y2hlcyB0byBvcGtnLXV0
aWxzIHdoaWNoIHN1cHBvcnQgaGllcmFyY2hpY2FsCnBhY2thZ2UgZmVlZHMuCgpTaWduZWQtb2Zm
LWJ5OiBQYXVsIEJhcmtlciA8cGF1bEBwYXVsYmFya2VyLm1lLnVrPgotLS0KIG1ldGEvY2xhc3Nl
cy9wYWNrYWdlX2lway5iYmNsYXNzIHwgMjEgKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21l
dGEvY2xhc3Nlcy9wYWNrYWdlX2lway5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2VfaXBr
LmJiY2xhc3MKaW5kZXggMjk0OWQxZC4uNjgwYjliZiAxMDA2NDQKLS0tIGEvbWV0YS9jbGFzc2Vz
L3BhY2thZ2VfaXBrLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2VfaXBrLmJiY2xh
c3MKQEAgLTYzLDcgKzYzLDI2IEBAIHB5dGhvbiBkb19wYWNrYWdlX2lwayAoKSB7CiAgICAgICAg
IGJiLmRhdGEudXBkYXRlX2RhdGEobG9jYWxkYXRhKQogICAgICAgICBiYXNlZGlyID0gb3MucGF0
aC5qb2luKG9zLnBhdGguZGlybmFtZShyb290KSkKICAgICAgICAgYXJjaCA9IGxvY2FsZGF0YS5n
ZXRWYXIoJ1BBQ0tBR0VfQVJDSCcsIFRydWUpCi0gICAgICAgIHBrZ291dGRpciA9ICIlcy8lcyIg
JSAob3V0ZGlyLCBhcmNoKQorICAgICAgICBpZiBsb2NhbGRhdGEuZ2V0VmFyKCdJUEtfSElFUkFS
Q0hJQ0FMX0ZFRUQnKSA9PSAiMSI6CisgICAgICAgICAgICAjIFNwcmVhZCBwYWNrYWdlcyBhY3Jv
c3Mgc3ViZGlyZWN0b3JpZXMgc28gZWFjaCBpc24ndCB0b28gY3Jvd2RlZAorICAgICAgICAgICAg
aWYgcGtnbmFtZS5zdGFydHN3aXRoKCdsaWInKToKKyAgICAgICAgICAgICAgICBwa2dfcHJlZml4
ID0gJ2xpYicgKyBwa2duYW1lWzNdCisgICAgICAgICAgICBlbHNlOgorICAgICAgICAgICAgICAg
IHBrZ19wcmVmaXggPSBwa2duYW1lWzBdCisKKyAgICAgICAgICAgICMgS2VlcCAtZGJnLCAtZGV2
LCAtZG9jLCAtc3RhdGljZGV2IGFuZCAtbG9jYWxlLSogcGFja2FnZXMgdG9nZXRoZXIKKyAgICAg
ICAgICAgIGlmIHBrZ25hbWVbLTQ6XSBpbiAoJy1kYmcnLCAnLWRldicsICctZG9jJyk6CisgICAg
ICAgICAgICAgICAgcGtnX3N1YmRpciA9IHBrZ25hbWVbOi00XQorICAgICAgICAgICAgZWxpZiBw
a2duYW1lLmVuZHN3aXRoKCctc3RhdGljZGV2Jyk6CisgICAgICAgICAgICAgICAgcGtnX3N1YmRp
ciA9IHBrZ25hbWVbOi0xMF0KKyAgICAgICAgICAgIGVsaWYgJy1sb2NhbGUtJyBpbiBwa2duYW1l
OgorICAgICAgICAgICAgICAgIHBrZ19zdWJkaXIgPSBwa2duYW1lWzpwa2duYW1lLmZpbmQoJy1s
b2NhbGUtJyldCisgICAgICAgICAgICBlbHNlOgorICAgICAgICAgICAgICAgIHBrZ19zdWJkaXIg
PSBwa2duYW1lCisKKyAgICAgICAgICAgIHBrZ291dGRpciA9ICIlcy8lcy8lcy8lcyIgJSAob3V0
ZGlyLCBhcmNoLCBwa2dfcHJlZml4LCBwa2dfc3ViZGlyKQorICAgICAgICBlbHNlOgorICAgICAg
ICAgICAgcGtnb3V0ZGlyID0gIiVzLyVzIiAlIChvdXRkaXIsIGFyY2gpCiAgICAgICAgIGJiLnV0
aWxzLm1rZGlyaGllcihwa2dvdXRkaXIpCiAgICAgICAgIG9zLmNoZGlyKHJvb3QpCiAgICAgICAg
IGNsZWFudXBjb250cm9sKHJvb3QpCi0tIAoxLjkuMgoK

--001a11c361dc706a8204f86d7ec5--

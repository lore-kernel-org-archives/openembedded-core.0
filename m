Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id D7E6C70101
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 15:27:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 92874208CD;
	Tue,  7 Feb 2017 10:27:11 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Tue, 07 Feb 2017 10:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=aJ1Cy1+4i2ReS2
	yFs+eCFna2OJI=; b=MyP9C1/hF95rHex16pHQXEP7mabFaD6Qknlt1r5hWgtjs7
	QnfenzRdj9JAIv7rJ6BaoAj3w5nPX5w0bWlVdMGjEseu1kxo1H8rTumQTt+9OnG9
	WJ5rnPxMZTvClums7uMIOkNKvHKQr/Ct2ivD509ySdlsFtnyeucGz0QNq3D2o=
X-ME-Sender: <xms:T-eZWFgFzCZftxp-fb8QxLZbe7YENiJDcmcJoVLEUIAZWaebSeR59g>
X-Sasl-enc: /FpbNya/CYjTgbvwBWwnIJAQZ0LtoFEunbTcoZTPv4F6 1486481231
Received: from laptop (unknown [192.40.95.2])
	by mail.messagingengine.com (Postfix) with ESMTPA id D2D3A2454F;
	Tue,  7 Feb 2017 10:27:10 -0500 (EST)
Message-ID: <1486481229.21003.7.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: "Burton, Ross" <ross.burton@intel.com>, Andreas
	=?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 07 Feb 2017 17:27:09 +0200
In-Reply-To: <CAJTo0LYogrcREAzmPUdBwcP6Yx5e-oZEBOTL1EnpVD9jwg=XiA@mail.gmail.com>
References: <1485178169-27145-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYogrcREAzmPUdBwcP6Yx5e-oZEBOTL1EnpVD9jwg=XiA@mail.gmail.com>
X-Mailer: Evolution 3.22.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Tue, 07 Feb 2017 15:27:14 -0000
X-Groupsio-MsgNum: 92954
Content-Type: multipart/mixed; boundary="=-mu7WN8swg79im48lOqKa"

--=-mu7WN8swg79im48lOqKa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-01-23 at 14:04 +0000, Burton, Ross wrote:
> On 23 January 2017 at 13:29, Andreas Müller <schnitzeltony@googlemail.com>
> wrote:
> 
> > +# no python -> smixer is not build
> > +ALLOW_EMPTY_${PN} = "1"
> > 
> 
> Not sure this is the right fix.  What package does the Python support go
> into?  The smixer files should be in that package, and the real dependency
> on PN-dev is to libasound, not PN.  Can we fiddle the PN-dev RDEPENDS to
> ensure that it depends on libasound instead of PN?

Andreas got busy with other stuff, so I started working on this. This
seems to work:

RDEPENDS_${PN}-dev = "libasound"

I first tried this:

RDEPENDS_${PN}-dev_remove = "alsa-lib"

That didn't work, I got an exception in some Python code. The full
error message is attached. Is using _remove like this expected to work?

-- 
Tanu

https://www.patreon.com/tanuk

--=-mu7WN8swg79im48lOqKa
Content-Disposition: attachment; filename="error.txt"
Content-Type: text/plain; name="error.txt"; charset="UTF-8"
Content-Transfer-Encoding: base64

RVJST1I6IGFsc2EtbGliLTEuMS4zLXIwIGRvX3BhY2thZ2U6IEVycm9yIGV4ZWN1dGluZyBhIHB5
dGhvbiBmdW5jdGlvbiBpbiBleGVjX3B5dGhvbl9mdW5jKCkgYXV0b2dlbmVyYXRlZDoKClRoZSBz
dGFjayB0cmFjZSBvZiBweXRob24gY2FsbHMgdGhhdCByZXN1bHRlZCBpbiB0aGlzIGV4Y2VwdGlv
bi9mYWlsdXJlIHdhczoKRmlsZTogJ2V4ZWNfcHl0aG9uX2Z1bmMoKSBhdXRvZ2VuZXJhdGVkJywg
bGluZW5vOiAyLCBmdW5jdGlvbjogPG1vZHVsZT4KICAgICAwMDAxOgogKioqIDAwMDI6cGFja2Fn
ZV9maXhzeW1saW5rcyhkKQogICAgIDAwMDM6CkZpbGU6ICcvaG9tZS90YW51L2Rldi9vcGVuZW1i
ZWRkZWQtY29yZS9tZXRhL2NsYXNzZXMvcGFja2FnZS5iYmNsYXNzJywgbGluZW5vOiAxMjcxLCBm
dW5jdGlvbjogcGFja2FnZV9maXhzeW1saW5rcwogICAgIDEyNjc6ICAgICAgICByZGVwZW5kcyA9
IGJiLnV0aWxzLmV4cGxvZGVfZGVwX3ZlcnNpb25zMihkLmdldFZhcignUkRFUEVORFNfJyArIHBr
Zykgb3IgIiIpCiAgICAgMTI2ODogICAgICAgIGZvciBwIGluIG5ld3JkZXBlbmRzW3BrZ106CiAg
ICAgMTI2OTogICAgICAgICAgICBpZiBwIG5vdCBpbiByZGVwZW5kczoKICAgICAxMjcwOiAgICAg
ICAgICAgICAgICByZGVwZW5kc1twXSA9IFtdCiAqKiogMTI3MTogICAgICAgIGQuc2V0VmFyKCdS
REVQRU5EU18nICsgcGtnLCBiYi51dGlscy5qb2luX2RlcHMocmRlcGVuZHMsIGNvbW1hc2VwPUZh
bHNlKSkKICAgICAxMjcyOn0KICAgICAxMjczOgogICAgIDEyNzQ6CiAgICAgMTI3NTpweXRob24g
cGFja2FnZV9wYWNrYWdlX25hbWVfaG9vaygpIHsKRmlsZTogJy9ob21lL3RhbnUvZGV2L29wZW5l
bWJlZGRlZC1jb3JlL2JpdGJha2UvbGliL2JiL3V0aWxzLnB5JywgbGluZW5vOiAyNzYsIGZ1bmN0
aW9uOiBqb2luX2RlcHMKICAgICAwMjcyOiAgICBmb3IgZGVwIGluIGRlcHM6CiAgICAgMDI3Mzog
ICAgICAgIGlmIGRlcHNbZGVwXToKICAgICAwMjc0OiAgICAgICAgICAgIGlmIGlzaW5zdGFuY2Uo
ZGVwc1tkZXBdLCBsaXN0KToKICAgICAwMjc1OiAgICAgICAgICAgICAgICBmb3IgdiBpbiBkZXBz
W2RlcF06CiAqKiogMDI3NjogICAgICAgICAgICAgICAgICAgIHJlc3VsdC5hcHBlbmQoZGVwICsg
IiAoIiArIHYgKyAiKSIpCiAgICAgMDI3NzogICAgICAgICAgICBlbHNlOgogICAgIDAyNzg6ICAg
ICAgICAgICAgICAgIHJlc3VsdC5hcHBlbmQoZGVwICsgIiAoIiArIGRlcHNbZGVwXSArICIpIikK
ICAgICAwMjc5OiAgICAgICAgZWxzZToKICAgICAwMjgwOiAgICAgICAgICAgIHJlc3VsdC5hcHBl
bmQoZGVwKQpFeGNlcHRpb246IFR5cGVFcnJvcjogdW5zdXBwb3J0ZWQgb3BlcmFuZCB0eXBlKHMp
IGZvciArOiAnTm9uZVR5cGUnIGFuZCAnc3RyJwoKRVJST1I6IGFsc2EtbGliLTEuMS4zLXIwIGRv
X3BhY2thZ2U6IEZ1bmN0aW9uIGZhaWxlZDogcGFja2FnZV9maXhzeW1saW5rcwpFUlJPUjogTG9n
ZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjogL21lZGlhL3RhbnUvTGFDaWUyL29lX2J1aWxkL3Rt
cC1nbGliYy93b3JrL2NvcmUyLTY0LW9lLWxpbnV4L2Fsc2EtbGliLzEuMS4zLXIwL3RlbXAvbG9n
LmRvX3BhY2thZ2UuMTA4MDQKRVJST1I6IFRhc2sgKC9ob21lL3RhbnUvZGV2L29wZW5lbWJlZGRl
ZC1jb3JlL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4xLjMuYmI6ZG9f
cGFja2FnZSkgZmFpbGVkIHdpdGggZXhpdCBjb2RlICcxJwo=

--=-mu7WN8swg79im48lOqKa--

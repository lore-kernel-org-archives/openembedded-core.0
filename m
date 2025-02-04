Return-Path: <rashaadxavant@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD134C0218F
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 05:59:55 +0000 (UTC)
Subject: iMX6ULL Ethernet on Scarthgap 6.6.52  #bitbake #scarthgap
To: openembedded-core@lists.openembedded.org
From: rashaadxavant@gmail.com
X-Originating-Location: Johannesburg, Gauteng, ZA (197.245.205.96)
X-Originating-Platform: Mac Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 21:59:53 -0800
Message-ID: <jxRB.1738648793403095330.T1sX@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qtbp8g6ewGCmggJc024Y"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210750

--qtbp8g6ewGCmggJc024Y
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have migrated over to a Yocto build with the 6.6.52 kernel, and I am stru=
ggling to get the Ethernet to work. When migrating, I have noticed that the=
 TX_CLK line is a constant value and not a sinusoidal clock. I have tried b=
uilding multiple boards from the meta-3rd-party layer, however I have not b=
een able to see a clock signal.

Please advise if something needs to change in my config:

pinctrl_enet2 : enet2grp {
fsl,pins =3D <
MX6UL_PAD_GPIO1_IO07__ENET2_MDC 0x1b0b0
MX6UL_PAD_GPIO1_IO06__ENET2_MDIO 0x1b0b0
MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN 0x1b0b0
MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER 0x1b0b0
MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00 0x1b0b0
MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01 0x1b0b0
MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN 0x1b0b0
MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00 0x1b0b0
MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01 0x1b0b0
MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2 0x4001b031
>;
};

&fec2 {
pinctrl-names =3D "default" ;
pinctrl-0 =3D < &pinctrl_enet2 >;
phy-mode =3D "rmii" ;
phy-handle =3D < &ethphy1 >;
// phy-reset-gpios =3D <&gpio5 8 GPIO_ACTIVE_LOW>;
// phy-reset-duration =3D <200>;
status =3D "okay" ;
mdio {
#address-cells =3D < 1 >;
#size-cells =3D < 0 >;

ethphy1 : ethernet-phy@1 {
compatible =3D "ethernet-phy-ieee802.3-c22" ;
clocks =3D < &clks IMX6UL_CLK_ENET2_REF >;
clock-names =3D "rmii-ref" ;
reg =3D < 0 >;
};
};
};

The same config worked on version 5.5.15 without these lines:

clocks =3D <&clks IMX6UL_CLK_ENET2_REF>;
clock-names =3D "rmii-ref";

Further, when reviewing the changes, I noticed that the following changed i=
n the imx6ul.dtsi file between the Yocto releases:

fec2: ethernet@20b4000 {
compatible =3D "fsl,imx6ul-fec", "fsl,imx6q-fec";
reg =3D <0x020b4000 0x4000>;
interrupt-names =3D "int0", "pps";
interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
<GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
clocks =3D <&clks IMX6UL_CLK_ENET>,
<&clks IMX6UL_CLK_ENET_AHB>,
<&clks IMX6UL_CLK_ENET_PTP>,
<&clks IMX6UL_CLK_ENET2_REF_125M>,
<&clks IMX6UL_CLK_ENET2_REF_125M>;
clock-names =3D "ipg", "ahb", "ptp",
"enet_clk_ref", "enet_out";
fsl,num-tx-queues =3D <1>;
fsl,num-rx-queues =3D <1>;
fsl,stop-mode =3D <&gpr 0x10 4>;
fsl,magic-packet;
fsl,wakeup_irq =3D <0>;
status =3D "disabled";
};

Became:

fec2: ethernet@20b4000 {
compatible =3D "fsl,imx6ul-fec", "fsl,imx6q-fec";
reg =3D <0x020b4000 0x4000>;
interrupt-names =3D "int0", "pps";
interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
<GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
clocks =3D <&clks IMX6UL_CLK_ENET>,
<&clks IMX6UL_CLK_ENET_AHB>,
<&clks IMX6UL_CLK_ENET_PTP>,
<&clks IMX6UL_CLK_ENET2_REF_SEL>;
clock-names =3D "ipg", "ahb", "ptp",
"enet_clk_ref";
fsl,num-tx-queues =3D <1>;
fsl,num-rx-queues =3D <1>;
fsl,stop-mode =3D <&gpr 0x10 4>;
fsl,magic-packet;
fsl,wakeup_irq =3D <0>;
status =3D "disabled";
};

Thank you for any assistance in advance.

--qtbp8g6ewGCmggJc024Y
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div id=3D"bodyDisplay" class=3D"lia-message-body lia-component-message-vie=
w-widget-body lia-component-body-signature-highlight-escalation lia-compone=
nt-message-view-widget-body-signature-highlight-escalation">
<div class=3D"lia-message-body-content">
<p>I have migrated over to a Yocto build with the 6.6.52 kernel, and I am s=
truggling to get the Ethernet to work. When migrating, I have noticed that =
the TX_CLK line is a constant value and not a sinusoidal clock. I have trie=
d building multiple boards from the meta-3rd-party layer, however I have no=
t been able to see a clock signal.<br /><br />Please advise if something ne=
eds to change in my config:<br /><br /></p>
<div style=3D"color: #cccccc; background-color: #1f1f1f; font-family: Menlo=
, Monaco, 'Courier New', monospace; font-weight: normal; font-size: 12px; l=
ine-height: 18px; white-space: pre;">
<div><span style=3D"color: #4ec9b0;">pinctrl_enet2</span><span style=3D"col=
or: #cccccc;">: </span><span style=3D"color: #dcdcaa;">enet2grp</span><span=
 style=3D"color: #cccccc;"> {</span></div>
<div><span style=3D"color: #cccccc;"> fsl,pins =3D &lt;</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_GPIO1_IO07__ENET2_MDC</span><span style=3D"color: #cccccc;"> </=
span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_GPIO1_IO06__ENET2_MDIO</span><span style=3D"color: #cccccc;"> <=
/span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN</span><span style=3D"color: #cccccc;">=
 </span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER</span><span style=3D"color: #cccccc;">=
 </span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00</span><span style=3D"color: #cccc=
cc;"> </span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01</span><span style=3D"color: #cccc=
cc;"> </span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN</span><span style=3D"color: #cccccc;">=
 </span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00</span><span style=3D"color: #cccc=
cc;"> </span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01</span><span style=3D"color: #cccc=
cc;"> </span><span style=3D"color: #b5cea8;">0x1b0b0</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #b5cea8;=
">MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2</span><span style=3D"color: #ccccc=
c;"> </span><span style=3D"color: #b5cea8;">0x4001b031</span></div>
<div><span style=3D"color: #cccccc;"> &gt;;</span></div>
<div><span style=3D"color: #cccccc;"> };</span></div>
</div>
<p><br /><br /></p>
<div style=3D"color: #cccccc; background-color: #1f1f1f; font-family: Menlo=
, Monaco, 'Courier New', monospace; font-weight: normal; font-size: 12px; l=
ine-height: 18px; white-space: pre;">
<div><span style=3D"color: #9cdcfe;">&amp;fec2</span><span style=3D"color: =
#cccccc;"> {</span></div>
<div><span style=3D"color: #cccccc;"> pinctrl-names =3D </span><span style=
=3D"color: #ce9178;">"default"</span><span style=3D"color: #cccccc;">;</spa=
n></div>
<div><span style=3D"color: #cccccc;"> pinctrl-0 =3D &lt;</span><span style=
=3D"color: #9cdcfe;">&amp;pinctrl_enet2</span><span style=3D"color: #cccccc=
;">&gt;;</span></div>
<div><span style=3D"color: #cccccc;"> phy-mode =3D </span><span style=3D"co=
lor: #ce9178;">"rmii"</span><span style=3D"color: #cccccc;">;</span></div>
<div><span style=3D"color: #cccccc;"> phy-handle =3D &lt;</span><span style=
=3D"color: #9cdcfe;">&amp;ethphy1</span><span style=3D"color: #cccccc;">&gt=
;;</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #6a9955;=
">// phy-reset-gpios =3D &lt;&amp;gpio5 8 GPIO_ACTIVE_LOW&gt;;</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #6a9955;=
">// phy-reset-duration =3D &lt;200&gt;;</span></div>
<div><span style=3D"color: #cccccc;"> status =3D </span><span style=3D"colo=
r: #ce9178;">"okay"</span><span style=3D"color: #cccccc;">;</span></div>
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #dcdcaa;=
">mdio</span><span style=3D"color: #cccccc;"> {</span></div>
<div><span style=3D"color: #cccccc;"> #address-cells =3D &lt;</span><span s=
tyle=3D"color: #b5cea8;">1</span><span style=3D"color: #cccccc;">&gt;;</spa=
n></div>
<div><span style=3D"color: #cccccc;"> #size-cells =3D &lt;</span><span styl=
e=3D"color: #b5cea8;">0</span><span style=3D"color: #cccccc;">&gt;;</span><=
/div>
<br />
<div><span style=3D"color: #cccccc;"> </span><span style=3D"color: #4ec9b0;=
">ethphy1</span><span style=3D"color: #cccccc;">: </span><span style=3D"col=
or: #dcdcaa;">ethernet-phy@1</span><span style=3D"color: #cccccc;"> {</span=
></div>
<div><span style=3D"color: #cccccc;"> compatible =3D </span><span style=3D"=
color: #ce9178;">"ethernet-phy-ieee802.3-c22"</span><span style=3D"color: #=
cccccc;">;</span></div>
<div><span style=3D"color: #cccccc;"> clocks =3D &lt;</span><span style=3D"=
color: #9cdcfe;">&amp;clks</span><span style=3D"color: #cccccc;"> </span><s=
pan style=3D"color: #b5cea8;">IMX6UL_CLK_ENET2_REF</span><span style=3D"col=
or: #cccccc;">&gt;;</span></div>
<div><span style=3D"color: #cccccc;"> clock-names =3D </span><span style=3D=
"color: #ce9178;">"rmii-ref"</span><span style=3D"color: #cccccc;">;</span>=
</div>
<div><span style=3D"color: #cccccc;"> reg =3D &lt;</span><span style=3D"col=
or: #b5cea8;">0</span><span style=3D"color: #cccccc;">&gt;;</span></div>
<div><span style=3D"color: #cccccc;"> };</span></div>
<div><span style=3D"color: #cccccc;"> };</span></div>
<div><span style=3D"color: #cccccc;">};</span></div>
</div>
<p><br /><br />The same config worked on version 5.5.15 without these lines=
:<br /><br />clocks =3D &lt;&amp;clks IMX6UL_CLK_ENET2_REF&gt;;<br />clock-=
names =3D "rmii-ref";<br /><br />Further, when reviewing the changes, I not=
iced that the following changed in the imx6ul.dtsi file between the Yocto r=
eleases:<br /><br />fec2: ethernet@20b4000 {<br />compatible =3D "fsl,imx6u=
l-fec", "fsl,imx6q-fec";<br />reg =3D &lt;0x020b4000 0x4000&gt;;<br />inter=
rupt-names =3D "int0", "pps";<br />interrupts =3D &lt;GIC_SPI 120 IRQ_TYPE_=
LEVEL_HIGH&gt;,<br />&lt;GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH&gt;;<br />clocks =
=3D &lt;&amp;clks IMX6UL_CLK_ENET&gt;,<br />&lt;&amp;clks IMX6UL_CLK_ENET_A=
HB&gt;,<br />&lt;&amp;clks IMX6UL_CLK_ENET_PTP&gt;,<br />&lt;&amp;clks IMX6=
UL_CLK_ENET2_REF_125M&gt;,<br />&lt;&amp;clks IMX6UL_CLK_ENET2_REF_125M&gt;=
;<br />clock-names =3D "ipg", "ahb", "ptp",<br />"enet_clk_ref", "enet_out"=
;<br />fsl,num-tx-queues =3D &lt;1&gt;;<br />fsl,num-rx-queues =3D &lt;1&gt=
;;<br />fsl,stop-mode =3D &lt;&amp;gpr 0x10 4&gt;;<br />fsl,magic-packet;<b=
r />fsl,wakeup_irq =3D &lt;0&gt;;<br />status =3D "disabled";<br />};<br />=
<br />Became:<br /><br />fec2: ethernet@20b4000 {<br />compatible =3D "fsl,=
imx6ul-fec", "fsl,imx6q-fec";<br />reg =3D &lt;0x020b4000 0x4000&gt;;<br />=
interrupt-names =3D "int0", "pps";<br />interrupts =3D &lt;GIC_SPI 120 IRQ_=
TYPE_LEVEL_HIGH&gt;,<br />&lt;GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH&gt;;<br />clo=
cks =3D &lt;&amp;clks IMX6UL_CLK_ENET&gt;,<br />&lt;&amp;clks IMX6UL_CLK_EN=
ET_AHB&gt;,<br />&lt;&amp;clks IMX6UL_CLK_ENET_PTP&gt;,<br />&lt;&amp;clks =
IMX6UL_CLK_ENET2_REF_SEL&gt;;<br />clock-names =3D "ipg", "ahb", "ptp",<br =
/>"enet_clk_ref";<br />fsl,num-tx-queues =3D &lt;1&gt;;<br />fsl,num-rx-que=
ues =3D &lt;1&gt;;<br />fsl,stop-mode =3D &lt;&amp;gpr 0x10 4&gt;;<br />fsl=
,magic-packet;<br />fsl,wakeup_irq =3D &lt;0&gt;;<br />status =3D "disabled=
";<br />};<br /><br />Thank you for any assistance in advance.</p>
</div>
</div>
</div>

--qtbp8g6ewGCmggJc024Y--

